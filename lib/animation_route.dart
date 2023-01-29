import 'package:flutter/material.dart';

class TransitionWithSlideTransition extends PageRouteBuilder {
  final Widget nextPage;
  TransitionWithSlideTransition({required this.nextPage})
      : super(
          pageBuilder: (context, animationDouble1, animationDouble2) =>
              nextPage,
          transitionsBuilder:
              (context, animationDouble1, animationDouble2, widget) {
            Tween<Offset> tween =
                Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
            //slide from right to left screen

            var curveAnimation = CurvedAnimation(
                parent: animationDouble1, curve: Curves.easeInBack);

            return SlideTransition(
              position: tween.animate(curveAnimation),
              child: widget,
            );
          },
          transitionDuration: const Duration(seconds: 1),
        );
}

class TransitionWithScaleTransition extends PageRouteBuilder {
  final Widget nextPage;
  TransitionWithScaleTransition({required this.nextPage})
      : super(
          pageBuilder: (context, animationDouble1, animationDouble2) =>
              nextPage,
          transitionsBuilder:
              (context, animationDouble1, animationDouble2, widget) {
            Tween<double> tween = Tween(begin: 0, end: 1);
            //scale from 0 until the whole screen ,if end:0.5 demi screen
            var curveAnimation = CurvedAnimation(
                parent: animationDouble1, curve: Curves.easeInBack);

            return ScaleTransition(
              scale: tween.animate(curveAnimation),
              child: widget,
            );
          },
          transitionDuration: const Duration(seconds: 1),
        );
}

class TransitionWithRotationTransition extends PageRouteBuilder {
  final Widget nextPage;
  TransitionWithRotationTransition({required this.nextPage})
      : super(
          pageBuilder: (context, animationDouble1, animationDouble2) =>
              nextPage,
          transitionsBuilder:
              (context, animationDouble1, animationDouble2, widget) {
            Tween<double> tween = Tween(begin: 0, end: 1);
            //rotate from 0 until the whole screen (360 degree),if end:0.5 (180 degree)

            var curveAnimation =
                CurvedAnimation(parent: animationDouble1, curve: Curves.linear);

            return RotationTransition(
              turns: tween.animate(curveAnimation),
              child: widget,
            );
          },
          transitionDuration: const Duration(seconds: 1),
        );
}

class TransitionWithSizeTransition extends PageRouteBuilder {
  final Widget nextPage;
  TransitionWithSizeTransition({required this.nextPage})
      : super(
          pageBuilder: (context, animationDouble1, animationDouble2) =>
              nextPage,
          transitionsBuilder:
              (context, animationDouble1, animationDouble2, widget) {
            //Size from center to the whole screen (alignment: Alignment.bottomCenter from bottom to center,)

            return Align(
              alignment: Alignment.center,
              child: SizeTransition(
                sizeFactor: animationDouble1,
                child: widget,
              ),
            );
          },
          transitionDuration: const Duration(seconds: 1),
        );
}

class TransitionWithFadeTransition extends PageRouteBuilder {
  final Widget nextPage;
  TransitionWithFadeTransition({required this.nextPage})
      : super(
          pageBuilder: (context, animationDouble1, animationDouble2) =>
              nextPage,
          transitionsBuilder:
              (context, animationDouble1, animationDouble2, widget) {
            //Size from center to the whole screen (alignment: Alignment.bottomCenter from bottom to center,)

            return FadeTransition(
              opacity: animationDouble1,
              child: widget,
            );
          },
          transitionDuration: const Duration(seconds: 1),
        );
}

class TransitionWithScaleAndRotationTransition extends PageRouteBuilder {
  final Widget nextPage;
  TransitionWithScaleAndRotationTransition({required this.nextPage})
      : super(
          pageBuilder: (context, animationDouble1, animationDouble2) =>
              nextPage,
          transitionsBuilder:
              (context, animationDouble1, animationDouble2, widget) {
            Tween<double> tween = Tween(begin: 0, end: 1);
            //scale from 0 until the whole screen ,if end:0.5 demi screen
            var curveAnimation = CurvedAnimation(
                parent: animationDouble1, curve: Curves.easeInBack);

            return ScaleTransition(
              scale: tween.animate(curveAnimation),
              child: RotationTransition(
                turns: tween.animate(curveAnimation),
                child: widget,
              ),
            );
          },
          transitionDuration: const Duration(seconds: 1),
        );
}
