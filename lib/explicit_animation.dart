// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    animation = Tween<double>(begin: 0, end: 100).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.forward) {}
        print(status);
      })
      ..addListener(() {
        setState(() {});
        print('Animation ${animation.value}');
        print('Controller ${controller.value}');
      });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Explicit Animation')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: -(pi / 2) * controller.value * 100,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.orange,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
