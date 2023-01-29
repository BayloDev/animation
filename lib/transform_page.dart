import 'dart:math';

import 'package:flutter/material.dart';

class TransformPage extends StatefulWidget {
  const TransformPage({super.key});

  @override
  State<TransformPage> createState() => _TransformPageState();
}

class _TransformPageState extends State<TransformPage> {
  double scale = 1;
  double dx = 0;
  double dy = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Transform'),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                origin: const Offset(-100, 0),
                scale: scale,
                child: Container(
                  color: Colors.teal,
                  width: 80,
                  height: 60,
                  child: const Center(
                    child: Text(
                      'Container',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(() => scale = scale == 1 ? 1.5 : 1),
                child: const Text('Transform.scale'),
              ),
              const SizedBox(height: 20),
              Transform.translate(
                offset: Offset(dx, dy),
                child: Container(
                  color: Colors.teal,
                  width: 80,
                  height: 60,
                  child: const Center(
                    child: Text(
                      'Container',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(
                  () {
                    dx = dx == 0 ? 30 : 0;
                    dy = dy == 0 ? 30 : 0;
                  },
                ),
                child: const Text('Transform.translate'),
              ),
              const SizedBox(height: 20),
              Transform.rotate(
                origin: const Offset(30, 40),
                angle: angle,
                child: Container(
                  color: Colors.teal,
                  width: 80,
                  height: 60,
                  child: const Center(
                    child: Text(
                      'Container',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(
                  () {
                    angle += pi / 6;
                  },
                ),
                child: const Text('Transform.translate'),
              ),
              const SizedBox(height: 20),
              Transform(
                origin: const Offset(30, 40),
                transform: Matrix4.rotationZ(pi / 12)
                  ..scale(1.2)
                  ..translate(10.0),
                child: Container(
                  color: Colors.teal,
                  width: 80,
                  height: 60,
                  child: const Center(
                    child: Text(
                      'Container',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => setState(
                  () {
                    angle += pi / 6;
                  },
                ),
                child: const Text('Transform.translate'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
