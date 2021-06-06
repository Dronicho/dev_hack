import 'package:flutter/material.dart';

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({required this.page})
      : super(
          reverseTransitionDuration: Duration(milliseconds: 100),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: Align(
              alignment: Alignment(0, -animation.value / 2),
              child: SizeTransition(
                sizeFactor: animation,
                child: child,
              ),
            ),
          ),
        );
}
