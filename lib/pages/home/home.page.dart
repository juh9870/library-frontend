import 'dart:io';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:library_front/pages/edit/edit-book.page.dart';
import 'package:library_front/router/app.router.dart';
import 'package:library_front/util/scrollbar.dart';
import 'package:library_front/widgets/book-compact.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:textless/textless.dart';

import '../../api.dart';
import '../../api/generated/library.swagger.dart';
import '../../widgets/appbar.dart';

part 'home.page.g.dart';

const rowsPerPage = 5;

final searchTextProvider = StateProvider((ref) => '');

const myBooksText = "Мої Книги";

@riverpod
Future<List<BookEntity>> fetchAllBooks(
    FetchAllBooksRef ref, String searchText) async {
  final isMy = searchText.trim().toLowerCase() == myBooksText.toLowerCase();
  if (isMy && ref.read(loginProvider) == null) return [];
  final books = isMy
      ? await apiClient.booksDraftsGet()
      : await apiClient.booksGet(tags: searchText);
  if (books.statusCode == HttpStatus.badRequest) return [];
  if (books.body == null) throw Exception("Failed to fetch books");
  return books.body!;
}

@cwidget
Widget _homePage(BuildContext ctx, WidgetRef ref,
    {@queryParam String search = ''}) {
  final booksState = ref.watch(fetchAllBooksProvider(search));
  WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(searchTextProvider.notifier).state = search);
  return Scaffold(
    appBar: mainAppBar(ctx),
    backgroundColor: Theme.of(ctx).canvasColor,
    body: AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: booksState.when(
          data: (data) => _HomePageReady(
              books: data,
              drafts: search.toLowerCase() == myBooksText.toLowerCase()),
          error: (err, stack) {
            throw Error.throwWithStackTrace(err, stack);
          },
          loading: () => const _HomePageLoading()),
    ),
  );
}

@hcwidget
Widget __homePageReady(BuildContext ctx, WidgetRef ref,
    {required List<BookEntity> books, required bool drafts}) {
  final authUser = ref.watch(loginProvider);
  if (books.isEmpty) {
    return Center(
      child: PhysicalModel(
        shadowColor: Colors.black,
        elevation: 8,
        color: Theme.of(ctx).colorScheme.primaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              "Нічого не знайдено".h3,
              SizedBox.fromSize(
                size: const Size.square(8),
              ),
              if (authUser != null)
                ElevatedButton(
                    onPressed: () {
                      ctx.router.navigate(EditBookRoute(bookId: null));
                    },
                    child: const Text('Додати книгу'))
            ],
          ),
        ),
      ),
    );
  }
  final controller = useScrollController();
  return scroll(
    controller: controller,
    child: CustomScrollView(
      physics: physics,
      controller: controller,
      slivers: [
        if (authUser != null && drafts)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    ctx.router.navigate(EditBookRoute(bookId: null));
                  },
                  child: const Text(
                    'Додати книгу',
                    style: TextStyle(fontSize: 32),
                  )),
            ),
          ),
        BookGrid(
          children: [
            for (var book in books)
              BookCompact(
                book: book,
              )
          ],
        ),
      ],
    ),
  );
}

@swidget
Widget __homePageLoading(BuildContext ctx) {
  final theme = Theme.of(ctx).colorScheme;
  return SizedBox.fromSize(
    size: const Size(double.infinity, double.infinity),
    child: Shimmer.fromColors(
      baseColor: theme.tertiary,
      highlightColor: theme.tertiaryContainer,
      child: ColoredBox(
        color: theme.surface,
      ),
    ),
  );
}

@cwidget
Widget _bookGrid(BuildContext ctx, WidgetRef ref,
    {required List<Widget> children}) {
  final crossAxisCount = calculateCrossAxisCount(ctx);
  final theme = Theme.of(ctx).colorScheme;
  final Color oddItemColor = theme.primary.withOpacity(0.05);
  final Color evenItemColor = theme.primary.withOpacity(0.15);
  return SliverList(
    delegate: SliverChildBuilderDelegate((context, index) {
      if (crossAxisCount * index >= children.length) return null;
      final widgets = List<Widget?>.from(children.sublist(
          crossAxisCount * index,
          min(crossAxisCount * (index + 1), children.length)));
      while (widgets.length < crossAxisCount) {
        widgets.add(null);
      }
      var curColor = index % 2;
      final rowChildren = widgets.map((w) {
        curColor = 1 - curColor;
        return Flexible(
            child: ColoredBox(
          color: [oddItemColor, evenItemColor][curColor],
          child: SizedBox(
              width: MediaQuery.of(ctx).size.width / crossAxisCount, child: w),
        ));
      }).toList();
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rowChildren,
        ),
      );
    }),
  );
}

int calculateCrossAxisCount(BuildContext ctx) {
  return max(3, (MediaQuery.of(ctx).size.width / 250).floor());
}
