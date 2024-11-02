import 'package:flutter/material.dart';
import 'package:flutter_components/app.dart';
import 'package:flutter_components/components/buttons.dart';
import 'package:flutter_components/components/infinite_moving_cards.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Components',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const App(bodyContent: InfiniteMovingCard()),
        '/components': (context) => const App(bodyContent: InfiniteMovingCard()),
        '/buttons': (context) => const App(bodyContent: AnimatedButtons()),
      },
      initialRoute: '/components',
    );
  }
}

