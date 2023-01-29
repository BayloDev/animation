import 'package:flutter/material.dart';

import 'animation_route.dart';
import 'next_page.dart';

class AnimationRouteTransitionPage extends StatelessWidget {
  const AnimationRouteTransitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationRouteTransitionPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                TransitionWithSlideTransition(nextPage: const NextPage()),
              ),
              child: const Text('Transition With SlideTransition'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                TransitionWithScaleTransition(nextPage: const NextPage()),
              ),
              child: const Text('Transition With ScaleTransition'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                TransitionWithRotationTransition(nextPage: const NextPage()),
              ),
              child: const Text('Transition With RotationTransition'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                TransitionWithSizeTransition(nextPage: const NextPage()),
              ),
              child: const Text('Transition With SizeTransition'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                TransitionWithFadeTransition(nextPage: const NextPage()),
              ),
              child: const Text('Transition With FadeTransition'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                TransitionWithScaleAndRotationTransition(
                    nextPage: const NextPage()),
              ),
              child: const Text('Transition With ScaleAndRotationTransition'),
            ),
          ],
        ),
      ),
    );
  }
}
