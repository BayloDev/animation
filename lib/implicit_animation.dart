import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double animatedContainerWidth = 80.0;
  double animatedContainerHeight = 40.0;
  Color animatedContainerColor = Colors.teal;
  double animatedContainerRadius = 0;
  bool showFirst = true;
  bool newStyle = false;
  double padding = 10;
  double opacity = 1;
  double elevation = 20;
  Color color = Colors.teal;
  BoxShape shape = BoxShape.rectangle;
  double top = 0;
  double right = 0;

  double scale = 1;
  double dx = 0;
  double dy = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Implicit Animation'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    width: animatedContainerWidth,
                    height: animatedContainerHeight,
                    curve: Curves.linear,
                    duration: const Duration(seconds: 2),
                    decoration: BoxDecoration(
                      color: animatedContainerColor,
                      borderRadius:
                          BorderRadius.circular(animatedContainerRadius),
                    ),
                    onEnd: () {
                      setState(() {
                        animatedContainerWidth = 80.0;
                        animatedContainerHeight = 40.0;
                        animatedContainerRadius = 0;
                        animatedContainerColor = Colors.teal;
                      });
                    },
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
                  ElevatedButton(
                    onPressed: () => setState(() {
                      animatedContainerHeight = 50;
                      animatedContainerWidth = 100;
                      animatedContainerRadius = 16;
                      animatedContainerColor = Colors.red;
                    }),
                    child: const Text('AnimatedContainer'),
                  ),
                  const Divider(height: 20, thickness: 3),
                  AnimatedCrossFade(
                    firstChild: Container(
                      color: Colors.teal,
                      width: 100,
                      height: 40,
                      child: const Center(
                        child: Text(
                          'First Child',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    secondChild: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Text('Second Child'),
                    ),
                    crossFadeState: showFirst == true
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(seconds: 2),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () => showFirst = !showFirst,
                    ),
                    child: const Text('AnimatedCrossFade'),
                  ),
                  const Divider(height: 20, thickness: 3),
                  AnimatedDefaultTextStyle(
                    style: newStyle
                        ? const TextStyle(color: Colors.black, fontSize: 16)
                        : const TextStyle(color: Colors.red, fontSize: 25),
                    duration: const Duration(seconds: 2),
                    onEnd: () {
                      setState(
                        () => newStyle = false,
                      );
                    },
                    child: const Text('Bilal Arbaoui'),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () => newStyle = true,
                    ),
                    child: const Text('AnimatedDefaultTextStyle'),
                  ),
                  const Divider(height: 20, thickness: 3),
                  Container(
                    color: Colors.teal,
                    child: AnimatedPadding(
                      onEnd: () {
                        setState(
                          () => padding = 10,
                        );
                      },
                      padding: EdgeInsets.all(padding),
                      duration: const Duration(seconds: 2),
                      child: const Text(
                        'Text',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () => padding = 20,
                    ),
                    child: const Text('AnimatedPadding'),
                  ),
                  const Divider(height: 20, thickness: 3),
                  Container(
                    height: 40,
                    width: 80,
                    color: Colors.teal,
                    child: AnimatedOpacity(
                      onEnd: () => setState(() => opacity = 1),
                      opacity: opacity,
                      duration: const Duration(seconds: 2),
                      child: const Center(
                        child: Text(
                          'Text',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () => opacity = 0,
                    ),
                    child: const Text('AnimatedOpacity'),
                  ),
                  const Divider(height: 20, thickness: 3),
                  AnimatedPhysicalModel(
                    shape: shape,
                    elevation: elevation,
                    color: color,
                    shadowColor: color,
                    duration: const Duration(seconds: 2),
                    child: const SizedBox(
                      width: 80,
                      height: 40,
                      child: Center(
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
                  ElevatedButton(
                    onPressed: () => setState(
                      () {
                        elevation = 0;
                        color = Colors.red;
                        shape = BoxShape.circle;
                      },
                    ),
                    child: const Text('AnimatedPhysicalModel'),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 200,
                        color: Colors.teal,
                      ),
                      AnimatedPositioned(
                        top: top,
                        right: right,
                        duration: const Duration(seconds: 2),
                        onEnd: () => setState(() {
                          top = 0;
                          right = 0;
                        }),
                        child: Container(
                          color: Colors.white70,
                          width: 30,
                          height: 20,
                          child: const Text(
                            'Bilal',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => setState(
                      () {
                        top = 80;
                        right = 170;
                      },
                    ),
                    child: const Text('AnimatedPositioned'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
