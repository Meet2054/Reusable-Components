import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  void _navigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey.shade400,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.home, size: 32),
                onPressed: () => _navigate(context, '/components'),
              ),
              IconButton(
                icon: const Icon(Icons.search, size: 32),
                onPressed: () => _navigate(context, '/buttons'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}