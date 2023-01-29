import 'dart:async';

import 'package:flutter/material.dart';

class ImplicitAnimationExemple extends StatefulWidget {
  const ImplicitAnimationExemple({super.key});

  @override
  State<ImplicitAnimationExemple> createState() =>
      _ImplicitAnimationExempleState();
}

class _ImplicitAnimationExempleState extends State<ImplicitAnimationExemple> {
  late List<String> name = [];
  late List<List<double>> info = [];
  Map<String, List<double>> listInfo = {
    'Algeria': [100, 200, 300, 200, 250, 400, 100, 200, 300, 200, 250, 400],
    'Morocco': [80, 200, 300, 250, 200, 350, 80, 200, 300, 250, 200, 350],
    'Tunisia': [50, 90, 200, 150, 300, 300, 50, 90, 200, 150, 300, 300],
  };
  late double heightAlg;
  late double heightMr;
  late double heightTn;
  bool isRestat = true;

  int i = 0;
  Timer? timer;
  double heightCountry(index) {
    return name[index] == 'Algeria'
        ? heightAlg
        : name[index] == 'Morocco'
            ? heightMr
            : heightTn;
  }

  @override
  void initState() {
    listInfo.forEach((key, value) {
      info.add(value);
      name.add(key);
    });

    heightAlg = info[0][0];
    heightMr = info[1][0];
    heightTn = info[2][0];

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation Exemple'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Stack(
            children: [
              const Positioned(
                right: 301,
                top: 29,
                child: Icon(Icons.keyboard_arrow_up),
              ),
              const Positioned(
                  right: 48,
                  bottom: 114,
                  child: Icon(Icons.keyboard_arrow_right)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text('400'),
                          const SizedBox(width: 1),
                          Positioned(
                            bottom: 525,
                            right: 230,
                            child: Container(
                              height: 1,
                              width: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 84),
                      Row(
                        children: [
                          const Text('300'),
                          const SizedBox(width: 1),
                          Positioned(
                            bottom: 525,
                            right: 230,
                            child: Container(
                              height: 1,
                              width: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 84),
                      Row(
                        children: [
                          const Text('200'),
                          const SizedBox(width: 1),
                          Positioned(
                            bottom: 525,
                            right: 230,
                            child: Container(
                              height: 1,
                              width: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 84),
                      Row(
                        children: [
                          const Text('100'),
                          const SizedBox(width: 1),
                          Positioned(
                            bottom: 525,
                            right: 230,
                            child: Container(
                              height: 1,
                              width: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 84),
                      Row(
                        children: [
                          const Text('   0 '),
                          const SizedBox(width: 3),
                          Positioned(
                            bottom: 525,
                            right: 230,
                            child: Container(
                              height: 1,
                              width: 10,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 118)
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        bottom: 110,
                        child: Container(
                          height: 450,
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      Stack(
                        children: [
                          const SizedBox(width: 20),
                          Positioned(
                            bottom: 125,
                            child: Container(
                              height: 1,
                              width: 300,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 250,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 500,
                                  width: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: info.length,
                                    itemBuilder: (context, index) => Expanded(
                                      child: Row(
                                        children: [
                                          Item(
                                            height: heightCountry(index),
                                            name: name[index],
                                          ),
                                          const SizedBox(width: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    timer = Timer.periodic(
                                      const Duration(seconds: 1),
                                      (timer) => i < info[0].length - 1
                                          ? setState(
                                              () {
                                                i++;
                                                heightAlg = info[0][i];
                                                heightMr = info[1][i];
                                                heightTn = info[2][i];
                                              },
                                            )
                                          : null,
                                    );
                                  },
                                  child: const Text('Start'),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    super.key,
    required this.height,
    required this.name,
  });

  final double height;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedContainer(
          color: Colors.black12,
          height: height,
          width: 30,
          duration: const Duration(seconds: 1),
        ),
        const SizedBox(height: 8),
        Text(name)
      ],
    );
  }
}
