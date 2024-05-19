/*


import 'package:flutter/material.dart';
// import 'package:custom_transition/custom_transition.dart';
//flutter pub add custom_transition
//  custom_transition: ^0.0.1

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class MagicRouter {
  static BuildContext? currentContext = navigatorKey.currentContext;
  static Future<dynamic> navigateTo(Widget page) =>
      navigatorKey.currentState!.push(_materialPageRoute(page));

  static Future<dynamic> navigateAndPopAll(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _materialPageRoute(page),
        (_) => false,
      );

  static Future<dynamic> navigateAndReplace(Widget page) =>
      navigatorKey.currentState!.pushReplacement(
        _materialPageRoute(page),
      );

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          _materialPageRoute(page), (route) => route.isFirst);

  static void pop() => navigatorKey.currentState!.pop();
  static Route<dynamic> _materialPageRoute(Widget page) => MaterialPageRoute(
        builder: (_) => page,
      );

  static Route<dynamic> _createRoute(
    Widget page, {
    duration = const Duration(milliseconds: 500),
    PageTransitionType animatetype = PageTransitionType.leftToRight,
  }) {
    return PageTransition(
      // settings: RouteSettings(),
      duration: duration,
      curve: Curves.easeInOutBack,
      type:
          PageTransitionType.leftToRight, // Choose your desired transition type
      child: page,
    );
  }

  static Route _createRoute2(
    Widget page, {
    duration = const Duration(milliseconds: 500),
    PageTransitionType animatetype = PageTransitionType.leftToRight,
  }) {
    return PageRouteBuilder(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutBack;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  //will start new navigator

//navigate time for animation
  static Future<dynamic> navigateAndPopAllwithtimer(
    Widget page, {
    Duration waittime = const Duration(milliseconds: 500),
    PageTransitionType animatetype = PageTransitionType.leftToRight,
  }) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _createRoute(
          page,
          duration: waittime,
        ),
        (_) => false,
      );

  /// /

  static Future<dynamic> navigateAndReplacewithtimer(
    Widget page, {
    Duration waittime = const Duration(milliseconds: 600),
    PageTransitionType animatetype = PageTransitionType.leftToRight,
  }) =>
      navigatorKey.currentState!.pushReplacement(
        _createRoute(page, duration: waittime, animatetype: animatetype),
      );

  static Future<dynamic> navigateAndPopUntilFirstPagewithtimer(
    Widget page, {
    Duration waittime = const Duration(milliseconds: 600),
    PageTransitionType animatetype = PageTransitionType.leftToRight,
  }) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          _createRoute(page, duration: waittime, animatetype: animatetype),
          (route) => route.isFirst);

//still not configure how to do that
  //static void popwithtimer() => navigatorKey.currentState!.pop();

  static Future<dynamic> navigateToWithtime(
    dynamic page, {
    Duration waittime = const Duration(milliseconds: 500),
    PageTransitionType animatetype = PageTransitionType.leftToRight,
  }) async {
    // await Future.delayed(waittime);
    navigatorKey.currentState!.push(
      _createRoute2(page, duration: waittime, animatetype: animatetype),
    );
  }

  static PageRouteBuilder<dynamic> _materialPagewithtime(
      Duration waittime, page) {
    return PageRouteBuilder(
      transitionDuration: waittime,
      pageBuilder: (_, __, ___) => page,
    );
  }
}
*/