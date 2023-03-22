import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:library_front/pages/book/book.page.dart';
import 'package:library_front/pages/edit/edit-book.page.dart';
import 'package:library_front/pages/home/home.page.dart';
import 'package:library_front/pages/login/login.page.dart';

part 'app.router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage),
    AutoRoute(path: '/login', page: LoginPage, initial: true),
    AutoRoute(path: '/books/:bookId', page: BookPage),
    AutoRoute(path: '/edit/:bookId', page: EditBookPage),
  ],
)
class AppRouter extends _$AppRouter {}
