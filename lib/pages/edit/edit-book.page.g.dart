// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit-book.page.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class EditBookPage extends ConsumerWidget {
  const EditBookPage(
    @PathParam('bookId') this.bookId, {
    Key? key,
  }) : super(key: key);

  final String? bookId;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      _editBookPage(
        _context,
        _ref,
        bookId,
      );
}

class _BookEditor extends HookConsumerWidget {
  const _BookEditor(
    this.startingBook, {
    Key? key,
  }) : super(key: key);

  final BookEntity? startingBook;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __bookEditor(
        _context,
        _ref,
        startingBook,
      );
}

class _BookSave extends HookConsumerWidget {
  const _BookSave(
    this.formKey,
    this.startingBook, {
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormBuilderState> formKey;

  final BookEntity? startingBook;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      __bookSave(
        _context,
        _ref,
        formKey,
        startingBook,
      );
}

class _TagsEditor extends HookWidget {
  const _TagsEditor(
    this.field, {
    Key? key,
  }) : super(key: key);

  final FormFieldState<List<BookEntity$Tags$Item>> field;

  @override
  Widget build(BuildContext _context) => __tagsEditor(
        _context,
        field,
      );
}

class _WrapItem extends StatelessWidget {
  const _WrapItem({
    Key? key,
    required this.child,
    this.delete = false,
  }) : super(key: key);

  final Widget child;

  final bool delete;

  @override
  Widget build(BuildContext _context) => __wrapItem(
        _context,
        child: child,
        delete: delete,
      );
}

class _SingleTagEditor extends HookWidget {
  const _SingleTagEditor(
    this.tag,
    this.onChange, {
    Key? key,
  }) : super(key: key);

  final BookEntity$Tags$Item tag;

  final void Function(BookEntity$Tags$Item) onChange;

  @override
  Widget build(BuildContext _context) => __singleTagEditor(
        _context,
        tag,
        onChange,
      );
}
