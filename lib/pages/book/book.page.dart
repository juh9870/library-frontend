// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:library_front/api/generated/library.swagger.dart';
import 'package:library_front/pages/home/home.page.dart';
import 'package:library_front/router/app.router.dart';
import 'package:library_front/util/scrollbar.dart';
import 'package:library_front/util/text.dart';
import 'package:library_front/widgets/appbar.dart';
import 'package:library_front/widgets/book-compact.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:textless/textless.dart';
import 'package:file_saver/file_saver.dart';
import 'package:path/path.dart' as p;
import 'package:dio/dio.dart';

import '../../api.dart';

part 'book.page.g.dart';

@cwidget
Widget _bookPage(BuildContext ctx, @PathParam('bookId') String bookId) {
  return Scaffold(
      appBar: mainAppBar(ctx),
      body: Center(
        child: _BookBlock(bookId),
      ));
}

@hcwidget
Widget __bookBlock(BuildContext ctx, WidgetRef ref, String bookId) {
  final book = ref.watch(fetchBookProvider(bookId));
  final controller = useScrollController();
  return book.when(
      data: (data) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: scroll(
            controller: controller,
            child: SingleChildScrollView(
              physics: physics,
              controller: controller,
              child: Card(
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedSize(
                            duration: const Duration(milliseconds: 500),
                            child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 300),
                                child: BookCover(data)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _BookInfo(data),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: data.description.text.size(20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) =>
          Error.throwWithStackTrace(error, stackTrace),
      loading: () => const CircularProgressIndicator());
}

@cwidget
Widget __bookInfo(BuildContext ctx, WidgetRef ref, BookEntity book) {
  final authors = book.tags
      .where((element) => element.type == BookEntity$Tags$ItemType.author);
  final genres = book.tags
      .where((element) => element.type == BookEntity$Tags$ItemType.genre);
  final authUser = ref.watch(loginProvider);
  final isEditable = authUser != null &&
      (authUser.permissions.contains(UserEntityPermissions.admin) ||
          (book.state == BookEntityState.draft && book.userId == authUser.id));
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (book.state == BookEntityState.draft)
        Card(
          color: Colors.yellow.shade300,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: "Статус: Чорнетка".h4,
          ),
        ),
      if (book.state == BookEntityState.unapproved)
        Card(
          color: Colors.green.shade300,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: "Статус: очікує модерації".h4,
          ),
        ),
      '«${book.title}»'.h4.bold,
      for (final author in authors) author.name.h4.bold,
      SizedBox.fromSize(
        size: const Size.fromHeight(4),
      ),
      'Назва: ${book.title}'.text,
      SizedBox.fromSize(
        size: const Size.fromHeight(4),
      ),
      if (isEditable) ...[
        ElevatedButton(
            onPressed: () {
              ctx.router.navigate(EditBookRoute(bookId: book.id));
            },
            child: "Редагувати".textd),
        SizedBox.fromSize(
          size: const Size.fromHeight(4),
        ),
        ElevatedButton(
            onPressed: () {
              updateBookCover(ctx, ref, book);
            },
            child: "Змінити обкладинку".textd),
        SizedBox.fromSize(
          size: const Size.fromHeight(4),
        ),
        ElevatedButton(
            onPressed: () {
              updateBookFile(ctx, ref, book);
            },
            child: "Змінити файл".textd),
        SizedBox.fromSize(
          size: const Size.fromHeight(4),
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                final result = await apiClient.booksIdSubmitPost(id: book.id);
                if(result.isSuccessful) {
                  ref.invalidate(fetchBookProvider(book.id));
                  ref.invalidate(fetchAllBooksProvider(myBooksText));
                  if(ctx.mounted) ctx.router.pop();
                  return;
                }
              } catch (e) {
              }
              if (ctx.mounted) {
                MotionToast.error(
                  title: "Помилка!".textd,
                  description: "Не вдалося відправити на модерацію".textd,
                ).show(ctx);
              }
            },
            child: "Відправити на модерацію".textd),
        SizedBox.fromSize(
          size: const Size.fromHeight(4),
        ),
      ],
      SizedBox.fromSize(
        size: const Size.fromHeight(4),
      ),
      if (authors.isNotEmpty)
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 4,
            children: [
              (authors.length == 1 ? 'Письменник: ' : 'Письменники: ')
                  .text
                  .bold,
              for (final author in authors) _TagLink(author)
            ]),
      SizedBox.fromSize(
        size: const Size.fromHeight(4),
      ),
      if (genres.isNotEmpty)
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 4,
            runSpacing: 4,
            children: [
              'Жанри: '.text.bold,
              for (final genre in genres) _TagLink(genre)
            ]),
      SizedBox.fromSize(
        size: const Size.fromHeight(4),
      ),
      if (book.bookFile != null) _DownloadBtn(book)
    ],
  );
}

Future<void> updateBookCover(
    BuildContext ctx, WidgetRef ref, BookEntity book) async {
  final result = await FilePicker.platform
      .pickFiles(type: FileType.image, allowMultiple: false);
  final files = result?.files;
  if (files == null || files.isEmpty) {
    if (!ctx.mounted) return;
    MotionToast.warning(
      title: "Оберіть файл".textd,
      description: "Файл не було обрано".textd,
    ).show(ctx);
  }
  final cover = files!.first;
  try {
    List<int> bytes;
    if (cover.path != null) {
      bytes = await File(cover.path!).readAsBytes();
    } else {
      bytes = cover.bytes!.toList();
    }

    final dio = Dio();
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(bytes, filename: cover.name),
    });
    final res = await dio.post('$apiBaseUri/books/${book.id}/cover',
        data: formData, options: Options(headers: authHeaders()));

    // final result = await apiClient.booksIdCoverPost(
    //     id: book.id, image: bytes);

    if ((res.statusCode ?? 500) < 400) {
      ref.invalidate(fetchBookProvider(book.id));
      ref.invalidate(fetchAllBooksProvider);

      if (!ctx.mounted) return;
      await CachedNetworkImage.evictFromCache(bookCoverUrl(book));
      MotionToast.success(
        title: "Успіх!".textd,
        description: "Обкладинку оновлено!".textd,
      ).show(ctx);
      return;
    }
  } catch (e) {}
  if (ctx.mounted) {
    MotionToast.error(
      title: "Помилка!".textd,
      description: "не вдалося оновити обкладинку".textd,
    ).show(ctx);
  }
}

Future<void> updateBookFile(
    BuildContext ctx, WidgetRef ref, BookEntity book) async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  final files = result?.files;
  if (files == null || files.isEmpty) {
    if (!ctx.mounted) return;
    MotionToast.warning(
      title: "Оберіть файл".textd,
      description: "Файл не було обрано".textd,
    ).show(ctx);
  }
  final file = files!.first;
  try {
    List<int> bytes;
    if (file.path != null) {
      bytes = await File(file.path!).readAsBytes();
    } else {
      bytes = file.bytes!.toList();
    }

    final dio = Dio();
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(bytes, filename: file.name),
    });
    final res = await dio.post('$apiBaseUri/books/${book.id}/file',
        data: formData, options: Options(headers: authHeaders()));

    if ((res.statusCode ?? 500) < 400) {
      ref.invalidate(fetchBookProvider(book.id));
      ref.invalidate(fetchAllBooksProvider);
      ref.invalidate(fetchBookFileProvider(book.id));

      if (!ctx.mounted) return;
      MotionToast.success(
        title: "Успіх!".textd,
        description: "Файл оновлено!".textd,
      ).show(ctx);
      return;
    }
  } catch (e) {}
  if (ctx.mounted) {
    MotionToast.error(
      title: "Помилка!".textd,
      description: "не вдалося оновити файл".textd,
    ).show(ctx);
  }
}

@cwidget
Widget __tagLink(WidgetRef ref, BookEntity$Tags$Item tag) {
  return OutlinedButton(
      onPressed: () {
        final search = ref.read(searchTextProvider.notifier);
        var newText = search.state;
        if (newText.isNotEmpty) newText += '; ';
        newText += "${tag.type.value}:${tag.name}";
        search.state = newText;
      },
      child: tag.name.textd);
}

@riverpod
Future<String> fetchBookFile(FetchBookFileRef ref, String id) async {
  final file = await apiClient.booksIdFileGet(id: id);
  if (file.body == null) throw Exception("Failed to fetch book");
  return file.body!;
}

@hcwidget
Widget __downloadBtn(BuildContext ctx, WidgetRef ref, BookEntity book) {
  final isDownloading = useState(false);
  if (!isDownloading.value) {
    return ElevatedButton(
        onPressed: () {
          isDownloading.value = true;
        },
        child: "Завантажити".textd);
  }
  final fileState = ref.watch(fetchBookFileProvider(book.id));
  return fileState.when(data: (data) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isDownloading.value = false;
      download(ctx, data.codeUnits,
          downloadName: "${book.title}_${book.bookFile!}");
      ref.invalidate(fetchBookFileProvider(book.id));
    });
    return ElevatedButton(onPressed: null, child: "Відкриття файлу...".textd);
  }, error: (error, stackTrace) {
    Error.throwWithStackTrace(error, stackTrace);
  }, loading: () {
    return ElevatedButton(onPressed: null, child: "Завантаження...".textd);
  });
}

void download(
  BuildContext context,
  List<int> bytes, {
  required String downloadName,
}) {
  FileSaver.instance.saveFile(
      downloadName, Uint8List.fromList(bytes), p.extension(downloadName));

  MotionToast.success(
    title: "Успіх!".textd,
    description: "Файл $downloadName збережено в папку завантаженнь".textd,
  ).show(context);
  // // Encode our file in base64
  // final base64 = base64Encode(bytes);
  // // Create the link with the file
  // final anchor =
  //     AnchorElement(href: 'data:application/octet-stream;base64,$base64')
  //     AnchorElement(href: 'data:application/octet-stream;base64,$base64')
  //       ..target = 'blank';
  // // add the name
  // if (downloadName != null) {
  //   anchor.download = downloadName;
  // }
  // // trigger download
  // document.body?.append(anchor);
  // anchor.click();
  // anchor.remove();
  return;
}
