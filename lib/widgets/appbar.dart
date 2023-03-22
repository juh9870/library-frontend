import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:library_front/api.dart';
import 'package:library_front/router/app.router.dart';
import 'package:library_front/util/text.dart';
import 'package:textless/textless.dart';

import '../pages/home/home.page.dart';

part 'appbar.g.dart';

AppBar mainAppBar(BuildContext ctx) {
  return AppBar(
    title: const _AppBarTitle(),
    shadowColor: Theme.of(ctx).colorScheme.shadow,
    scrolledUnderElevation: 15,
  );
}

@cwidget
Widget __appBarTitle(BuildContext ctx, WidgetRef ref) {
  final color = Theme.of(ctx).colorScheme;
  final authUser = ref.watch(loginProvider);
  return Row(
    children: [
      TextButton(
          onPressed: () {
            resetToMainPage(ctx: ctx, ref: ref, fullClear: true, search: '');
          },
          child: "UniLibrary".h2.color(color.onPrimary)),
      const Expanded(child: _SearchBar()),
      IconButton(
          onPressed: () => resetToMainPage(ctx: ctx, ref: ref),
          icon: const Icon(Icons.search)),
      if (authUser == null)
        TextButton.icon(
          onPressed: () {
            ctx.router.push(const LoginRoute());
          },
          icon: Icon(Icons.person, color: color.onPrimary),
          label: "Увійти".text.color(color.onPrimary),
        ),
      if (authUser != null)
        TextButton.icon(
          onPressed: () {
            resetToMainPage(ctx: ctx, ref: ref, search: myBooksText);
          },
          icon: Icon(
            Icons.import_contacts,
            color: color.onPrimary,
          ),
          label: 'Мої книги'.text.color(color.onPrimary),
        ),
      if (authUser != null)
        TextButton.icon(
          onPressed: () {
            ref.read(loginProvider.notifier).logout();
          },
          icon: Icon(Icons.logout, color: color.onPrimary),
          label: 'Вийти з системи'.text.color(color.onPrimary),
        )
    ],
  );
}

@hcwidget
Widget __searchBar(BuildContext ctx, WidgetRef ref) {
  final color = Theme.of(ctx).colorScheme;
  final searchText = ref.watch(searchTextProvider);
  final controller = useTextEditingController(text: searchText);
  controller.text = searchText;
  return Theme(
    data: Theme.of(ctx).copyWith(
        textSelectionTheme: TextSelectionThemeData(
            selectionColor: color.onPrimaryContainer,
            selectionHandleColor: color.onPrimary)),
    child: Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          ref.read(searchTextProvider.notifier).state = controller.text;
        }
      },
      child: TextField(
        controller: controller,
        onSubmitted: (text) {
          resetToMainPage(ctx: ctx, ref: ref, search: text);
        },
        style: TextStyle(color: color.onPrimary),
        cursorColor: color.onPrimary,
        decoration: InputDecoration(
            label: Row(
          children: [
            Icon(
              Icons.search,
              color: color.onPrimary,
            ),
            "Пошук".text.color(color.onPrimary)
          ],
        )),
      ),
    ),
  );
}

void resetToMainPage(
    {required BuildContext ctx,
    WidgetRef? ref,
    String? search,
    bool fullClear = false}) {
  search ??= ref?.read(searchTextProvider) ?? '';
  ref?.read(searchTextProvider.notifier).state = search;
  if (fullClear || search.isEmpty) {
    ctx.router.replaceAll([HomeRoute(search: search)]);
  } else {
    ctx.router.push(HomeRoute(search: search));
  }
}
