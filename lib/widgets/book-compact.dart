import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:library_front/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shimmer/shimmer.dart';

import '../api/generated/library.swagger.dart';
import 'package:textless/textless.dart';

part 'book-compact.g.dart';

@riverpod
Future<BookEntity> fetchBook(FetchBookRef ref, String id) async {
  final book = await apiClient.booksIdGet(id: id);
  if (book.body == null) throw Exception("Failed to fetch book");
  return book.body!;
}

@cwidget
Widget _bookCompact(BuildContext context, WidgetRef ref,
    {String? bookId, BookEntity? book}) {
  if (book != null) return _BookReady(book);
  if (bookId == null) {
    throw ArgumentError("Either 'bookId' or 'book' argument is required");
  }
  final bookHook = ref.watch(fetchBookProvider(bookId));
  return bookHook.when(
      data: (data) => _BookReady(data),
      error: (error, stackTrace) => const _BookError(),
      loading: () => const BookLoading());
}

@swidget
Widget _bookCover(BuildContext ctx, BookEntity book) {
  final theme = Theme.of(ctx).colorScheme;
  return CachedNetworkImage(
      imageUrl: bookCoverUrl(book),
      httpHeaders: authHeaders(),
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: theme.primaryContainer,
          highlightColor: theme.primary,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              color: Colors.black,
            ),
          ),
        );
      });
}

@cwidget
Widget __bookReady(BuildContext ctx, WidgetRef ref, BookEntity book) {
  return TextButton(
      onPressed: () {
        ctx.router.navigateNamed('/books/${book.id}');
      },
      child: _BookLayout(
          header: book.title.text.alignCenter, cover: BookCover(book)));
}

@swidget
Widget __bookError(
  BuildContext context,
) {
  return _BookLayout(
    header: "Loading error"
        .text
        .alignCenter
        .color(Theme.of(context).colorScheme.error),
    cover: const Icon(Icons.block),
  );
}

@swidget
Widget _bookLoading(BuildContext ctx) {
  final theme = Theme.of(ctx).colorScheme;
  return _BookLayout(
      header: "Завантаження".text.alignCenter,
      cover: Shimmer.fromColors(
        baseColor: theme.primaryContainer,
        highlightColor: theme.primary,
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            color: Colors.black,
          ),
        ),
      ));
}

@swidget
Widget __bookLayout({required Widget header, required Widget cover}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: header,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: cover,
      )
    ],
  );
}
