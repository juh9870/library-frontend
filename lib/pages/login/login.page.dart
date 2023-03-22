import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:library_front/api.dart';
import 'package:library_front/widgets/appbar.dart';

part 'login.page.g.dart';

@cwidget
Widget _loginPage(BuildContext ctx, WidgetRef ref) {
  final theme = Theme.of(ctx);
  return FlutterLogin(
      userValidator: (s) =>
          s == null || s.length < 3 ? 'Занадто коротке ім\'я' : null,
      passwordValidator: (p) {
        if (p == null || p.length < 8) return "Занадто короткий пароль";
        final r = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
        if(!r.hasMatch(p)) return "Пароль має містити великі та малі літери та цифри";
        return null;
      },
      onSubmitAnimationCompleted: () {
        resetToMainPage(ctx: ctx, ref: ref, fullClear: true);
      },
      onLogin: (data) async {
        try {
          final result = await loginNotifier.login(data.name, data.password);
          return null;
        } catch (e) {
          return 'Не вдалося увійти. Перевірте логін та пароль';
        }
      },
      onSignup: (data) async {
        try {
          final r1 = await loginNotifier.register(data.name!, data.password!);
          final r2 = await loginNotifier.login(data.name!, data.password!);
          return null;
        } catch (e) {
          return 'Не вдалося зареєструватися';
        }
      },
      messages: LoginMessages(
        userHint: 'Ім\'я користувача',
        passwordHint: 'Пароль',
        confirmPasswordHint: 'Повторіть пароль',
        loginButton: 'Увійти',
        signupButton: 'Зареєструватися',
        forgotPasswordButton: 'Забули пароль?',
        recoverPasswordButton: 'Відновити пароль',
        goBackButton: 'Назад',
        confirmPasswordError: 'Пароль не співпадає',
        recoverPasswordDescription: 'Відновлення паролю',
        recoverPasswordSuccess: 'Пароль відновленно!',
      ),
      userType: LoginUserType.name,
      onRecoverPassword: (_) {});
  // return AnimatedLogin(
  //   onLogin: (data) async {
  //     try {
  //       await loginNotifier.login(data.email, data.password);
  //     } catch (e) {
  //       return e.toString();
  //     }
  //   },
  //   onSignup: (data) async {
  //     try {
  //       await loginNotifier.register(data.email, data.password);
  //       await loginNotifier.login(data.email, data.password);
  //     } catch (e) {
  //       return e.toString();
  //     }
  //   },
  //   logo: "UniLibrary".h1.alignCenter.color(theme.colorScheme.onPrimary),
  //   loginDesktopTheme: LoginViewTheme(
  //       borderColor: theme.colorScheme.primaryContainer,
  //       fillColor: theme.colorScheme.primaryContainer,
  //       // checkColor: theme.colorScheme.primaryContainer,
  //       formFieldBackgroundColor: theme.canvasColor,
  //       animatedComponentOrder: const <AnimatedComponent>[
  //         AnimatedComponent(
  //             component: LoginComponents.logo,
  //             animationType: AnimationType.left),
  //         AnimatedComponent(
  //             component: LoginComponents.title,
  //             animationType: AnimationType.left),
  //         // AnimatedComponent(
  //         //     component: LoginComponents.description,
  //         //     animationType: AnimationType.left),
  //         AnimatedComponent(
  //             component: LoginComponents.formTitle,
  //             animationType: AnimationType.left),
  //         AnimatedComponent(component: LoginComponents.socialLogins),
  //         AnimatedComponent(component: LoginComponents.useEmail),
  //         AnimatedComponent(component: LoginComponents.form),
  //         AnimatedComponent(component: LoginComponents.notHaveAnAccount),
  //         // AnimatedComponent(
  //         //     component: LoginComponents.forgotPassword,
  //         //     animationType: AnimationType.left),
  //         AnimatedComponent(
  //             component: LoginComponents.changeActionButton,
  //             animationType: AnimationType.left),
  //         AnimatedComponent(component: LoginComponents.policyCheckbox),
  //         AnimatedComponent(
  //             component: LoginComponents.actionButton,
  //             animationType: AnimationType.left),
  //       ]),
  //   loginTexts: LoginTexts(
  //       welcome: "Ласкаво просимо",
  //       welcomeBack: "З поверненням",
  //       alreadyHaveAnAccount: "Вже маєте аккаунт?",
  //       notHaveAnAccount: "Не маєте аккаунту?",
  //       login: "Увійти",
  //       signUp: "Зареєструватися",
  //       loginFormTitle: "Увійти в аккаунт",
  //       signUpFormTitle: "Створити аккаунт",
  //       nameHint: "Ім'я користувача",
  //       loginEmailHint: "Електронна пошта",
  //       signupEmailHint: "Електронна пошта",
  //       loginPasswordHint: "Пароль",
  //       signupPasswordHint: "Пароль",
  //       confirmPasswordHint: "Повторіть пароль"),
  //   signUpMode: SignUpModes.both,
  // );
}
