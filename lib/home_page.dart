import 'package:animation/animation_route_transition_page.dart';
import 'package:animation/explicit_animation.dart';
import 'package:animation/transform_page.dart';
import 'package:flutter/material.dart';

import 'implicit_animation.dart';
import 'implicit_animation_exemple.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Map<String, Object>> pages = [
    {
      'AnimationRouteTransition': const AnimationRouteTransitionPage(),
    },
    {
      'Transform': const TransformPage(),
    },
    {
      'Implicit Animation': const ImplicitAnimation(),
    },
    {
      'Implicit Animation Exemple': const ImplicitAnimationExemple(),
    }
    ,
    {
      'Explicit Animation': const ExplicitAnimationPage(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView.builder(
            itemCount: pages.length,
            itemBuilder: (BuildContext context, int index) => ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => pages[index].values.first as Widget),
              ),
              child: Text(pages[index].keys.first),
            ),
          ),
        ),
      ),
    );
  }
}
