import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:library_front/api.dart';
import 'package:library_front/api/generated/library.swagger.dart';
import 'package:library_front/pages/home/home.page.dart';
import 'package:library_front/util/text.dart';
import 'package:library_front/widgets/book-compact.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:textless/textless.dart';
import 'package:reorderables/reorderables.dart';

import '../../widgets/appbar.dart';

part 'edit-book.page.g.dart';

@cwidget
Widget _editBookPage(
    BuildContext ctx, WidgetRef ref, @PathParam('bookId') String? bookId) {
  final book = bookId != null ? ref.watch(fetchBookProvider(bookId)) : null;
  return Scaffold(
      appBar: mainAppBar(ctx),
      body: Center(
        child: book?.when(
                data: (data) => _BookEditor(data),
                error: (err, stack) => Error.throwWithStackTrace(err, stack),
                loading: () => const CircularProgressIndicator()) ??
            const _BookEditor(null),
      ));
}

CreateBookDto? bookFromValue(Map<String, dynamic>? value, BookEntity? book) {
  if (value == null) return null;
  return CreateBookDto(
      title: value['title'] ?? book?.title,
      description: value['description'] ?? book?.description,
      publishedDate: book?.publishedDate ?? DateTime.now(),
      tags: ((value['tags'] ?? book?.tags ?? List<BookEntity$Tags$Item>.from([])) as List<BookEntity$Tags$Item>)
          .map((e) => CreateBookDto$Tags$Item(type: e.type, name: e.name))
          .toList());
}

enum SavingState { none, saving, success, error }

@hcwidget
Widget __bookEditor(BuildContext ctx, WidgetRef ref, BookEntity? startingBook) {
  final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
  return ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 1000),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: FormBuilderTextField(
                          name: 'title',
                          decoration:
                              const InputDecoration(labelText: 'Назва книги'),
                          initialValue: startingBook?.title,
                          validator: FormBuilderValidators.required(
                              errorText: 'Ім\'я не має бути пустим')),
                    ),
                    const SizedBox.square(
                      dimension: 10,
                    ),
                    _BookSave(formKey, startingBook)
                  ],
                ),
                FormBuilderTextField(
                    maxLines: null,
                    name: 'description',
                    decoration: const InputDecoration(labelText: 'Опис книги'),
                    initialValue: startingBook?.description,
                    validator: FormBuilderValidators.required(
                        errorText: 'Ім\'я не має бути пустим')),
                FormBuilderField<BookEntity$Tags>(
                    initialValue: startingBook?.tags,
                    name: 'tags',
                    builder: (field) => _TagsEditor(field))
              ],
            )),
      ),
    ),
  );
}

@hcwidget
Widget __bookSave(BuildContext ctx, WidgetRef ref,
    GlobalKey<FormBuilderState> formKey, BookEntity? startingBook) {
  final saving = useState(SavingState.none);
  if (saving.value == SavingState.success) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MotionToast.success(
        title: "Успіх!".textd,
        description: "Книгу збережено".textd,
      ).show(ctx);
      saving.value = SavingState.none;
      resetToMainPage(ctx: ctx, ref: ref, search: myBooksText, fullClear: true);
    });
  }
  if (saving.value == SavingState.error) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      MotionToast.error(
        title: "Помилка!".textd,
        description: "Не вдалося зберегти книгу".textd,
      ).show(ctx);
      saving.value = SavingState.none;
    });
  }
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 500),
    transitionBuilder: (child, animation) => ScaleTransition(
      scale: animation,
      child: child,
    ),
    child: saving.value != SavingState.saving
        ? TextButton.icon(
            onPressed: () async {
              if (!(formKey.currentState?.saveAndValidate() ?? false)) {
                saving.value = SavingState.error;
                return;
              }
              try {
                saving.value = SavingState.saving;
                if (startingBook == null) {
                  await apiClient.booksPost(
                      body: bookFromValue(formKey.currentState!.value, null));
                } else {
                  final book =
                      bookFromValue(formKey.currentState!.value, startingBook)!;
                  await apiClient.booksIdPatch(
                      id: startingBook.id,
                      body: UpdateBookDto(
                          title: book.title,
                          description: book.description,
                          tags: book.tags
                              .map((e) => UpdateBookDto$Tags$Item(
                                  type: e.type, name: e.name))
                              .toList()));
                  ref.invalidate(fetchBookProvider(startingBook.id));
                  ref.invalidate(fetchAllBooksProvider(myBooksText));
                }
                saving.value = SavingState.success;
              } catch (e) {
                saving.value = SavingState.error;
                rethrow;
              }
            },
            icon: const Icon(Icons.save),
            label: "Зберегти".text,
          )
        : const CircularProgressIndicator(),
  );
}

@hwidget
Widget __tagsEditor(BuildContext ctx, FormFieldState<BookEntity$Tags> field) {
  final tags = (field.value ?? []);
  final buttonKey = useMemoized(() => GlobalKey());
  final plusKey = useMemoized(() => GlobalKey());
  final deleteKey = useMemoized(() => GlobalKey());

  final showAddButton = useState(true);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      "Теги:".s2,
      ReorderableWrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        needsLongPressDraggable: true,
        runAlignment: WrapAlignment.start,
        onReorderStarted: (i) {
          showAddButton.value = false;
        },
        onNoReorder: (i) {
          showAddButton.value = true;
        },
        onReorder: (from, to) {
          final list = List<BookEntity$Tags$Item>.from(tags);
          if (to >= list.length) {
            list.removeAt(from);
          } else {
            list.insert(to, list.removeAt(from));
          }
          field.didChange(list);
          showAddButton.value = true;
        },
        children: [
          for (var e in tags.asMap().entries)
            _SingleTagEditor(e.value, (tag) {
              final list = List<BookEntity$Tags$Item>.from(tags);
              list[e.key] = tag;
              field.didChange(list);
            }),
          AnimatedSwitcher(
            key: buttonKey,
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return ClipRect(
                child: SlideTransition(
                  position: child.key == deleteKey
                      ? Tween<Offset>(
                              begin: const Offset(0, 1),
                              end: const Offset(0, 0))
                          .animate(animation)
                      : Tween<Offset>(
                              begin: const Offset(0, -1),
                              end: const Offset(0, 0))
                          .animate(animation),
                  child: child,
                ),
              );
            },
            child: showAddButton.value
                ? GestureDetector(
                    onLongPress: () {},
                    child: _WrapItem(
                      key: plusKey,
                      child: IconButton(
                        onPressed: () {
                          final list = List<BookEntity$Tags$Item>.from(tags);
                          list.add(BookEntity$Tags$Item(
                              type: BookEntity$Tags$ItemType.genre,
                              name: 'Назва тегу'));
                          field.didChange(list);
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ),
                  )
                : _WrapItem(
                    key: deleteKey,
                    delete: true,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ),
          ),
        ],
      ),
    ],
  );
}

@swidget
Widget __wrapItem(BuildContext ctx,
    {required Widget child, bool delete = false}) {
  final colors = Theme.of(ctx).colorScheme;
  return SizedBox(
    height: 60,
    child: Card(color: delete ? colors.error : colors.tertiary, child: child),
  );
}

final values = BookEntity$Tags$ItemType.values
    .where((element) => element.value != null)
    .toList();

final langs = {"AUTHOR": 'Автор', "GENRE": 'Жанр', "MISC": 'Інше'};

@hwidget
Widget __singleTagEditor(BuildContext ctx, BookEntity$Tags$Item tag,
    ValueChanged<BookEntity$Tags$Item> onChange) {
  final controller = useTextEditingController(text: tag.name);
  return _WrapItem(
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton(
              underline: const SizedBox.square(dimension: 0),
              items: values
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(langs[e.value] ?? e.value!),
                      ))
                  .toList(),
              value: tag.type,
              onChanged: (type) => onChange(tag.copyWith(type: type))),
          IntrinsicWidth(
            child: Focus(
              onFocusChange: (hasFocus) {
                if (!hasFocus) onChange(tag.copyWith(name: controller.text));
              },
              child: TextField(
                decoration: const InputDecoration(
                    labelText: 'Назва тегу', border: InputBorder.none),
                controller: controller,
                onSubmitted: (text) => onChange(tag.copyWith(name: text)),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
