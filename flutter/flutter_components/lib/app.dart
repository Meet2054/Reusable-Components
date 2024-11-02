import 'package:flutter/material.dart';
import 'footer.dart'; 

class App extends StatelessWidget {
  final Widget bodyContent;

  const App({super.key, required this.bodyContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyContent,
      bottomNavigationBar: const Footer(),
    );
  }
}
