import 'package:flutter/material.dart';

class ScreenRoute extends PageRouteBuilder {
  final Widget child;

  ScreenRoute({required this.child})
    : super(
        transitionDuration: Duration(milliseconds: 1700),
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.slowMiddle;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      );
}
