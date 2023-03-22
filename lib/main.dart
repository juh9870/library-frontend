// main.dart
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import './router/app.router.dart';
import './api.dart';

part 'main.g.dart';

Future<void> main() async {
  await loginNotifier.tryLoginFromStorage();
  runApp(const ProviderScope(child: Home()));
}
final _appRouter = AppRouter();
@cwidget
Widget _home(BuildContext context, WidgetRef ref) {
  return MaterialApp.router(
    theme: FlexThemeData.light(scheme: FlexScheme.espresso, blendLevel: 40),
    darkTheme: FlexThemeData.dark(scheme: FlexScheme.espresso, blendLevel: 40),
    themeMode: ThemeMode.light,
    routerDelegate: _appRouter.delegate(),
    routeInformationParser: _appRouter.defaultRouteParser(),
  );
}