// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<HomeRouteArgs>(
          orElse: () => HomeRouteArgs(
                  search: queryParams.getString(
                'search',
                '',
              )));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          search: args.search,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    BookRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BookRouteArgs>(
          orElse: () => BookRouteArgs(bookId: pathParams.getString('bookId')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: BookPage(
          args.bookId,
          key: args.key,
        ),
      );
    },
    EditBookRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<EditBookRouteArgs>(
          orElse: () =>
              EditBookRouteArgs(bookId: pathParams.optString('bookId')));
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: EditBookPage(
          args.bookId,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        RouteConfig(
          BookRoute.name,
          path: '/books/:bookId',
        ),
        RouteConfig(
          EditBookRoute.name,
          path: '/edit/:bookId',
        ),
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    String search = '',
  }) : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(
            key: key,
            search: search,
          ),
          rawQueryParams: {'search': search},
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.search = '',
  });

  final Key? key;

  final String search;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, search: $search}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [BookPage]
class BookRoute extends PageRouteInfo<BookRouteArgs> {
  BookRoute({
    required String bookId,
    Key? key,
  }) : super(
          BookRoute.name,
          path: '/books/:bookId',
          args: BookRouteArgs(
            bookId: bookId,
            key: key,
          ),
          rawPathParams: {'bookId': bookId},
        );

  static const String name = 'BookRoute';
}

class BookRouteArgs {
  const BookRouteArgs({
    required this.bookId,
    this.key,
  });

  final String bookId;

  final Key? key;

  @override
  String toString() {
    return 'BookRouteArgs{bookId: $bookId, key: $key}';
  }
}

/// generated route for
/// [EditBookPage]
class EditBookRoute extends PageRouteInfo<EditBookRouteArgs> {
  EditBookRoute({
    required String? bookId,
    Key? key,
  }) : super(
          EditBookRoute.name,
          path: '/edit/:bookId',
          args: EditBookRouteArgs(
            bookId: bookId,
            key: key,
          ),
          rawPathParams: {'bookId': bookId},
        );

  static const String name = 'EditBookRoute';
}

class EditBookRouteArgs {
  const EditBookRouteArgs({
    required this.bookId,
    this.key,
  });

  final String? bookId;

  final Key? key;

  @override
  String toString() {
    return 'EditBookRouteArgs{bookId: $bookId, key: $key}';
  }
}
