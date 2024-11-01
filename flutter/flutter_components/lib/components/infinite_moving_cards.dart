import 'package:flutter/material.dart';
import 'dart:async';

class InfiniteMovingCard extends StatefulWidget {
  const InfiniteMovingCard({super.key});

  @override
  InfiniteMovingCardState createState() => InfiniteMovingCardState();
}

class InfiniteMovingCardState extends State<InfiniteMovingCard> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  final List<String> cards = ['Card 1', 'Card 2', 'Card 3', 'Card 4', 'Card 5'];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      _scrollController.animateTo(
        _scrollController.offset + 5,
        duration: const Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Moving Cards'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(10.0),
            color: Colors.grey[500],
            height: 200,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 1000,
              itemBuilder: (context, index) {
                final cardIndex = index % cards.length;
                return Card(
                  color: Colors.accents[cardIndex % Colors.accents.length],
                  child: SizedBox(
                    width: 200,
                    // height: 100, 
                    child: Center(
                      child: Text(
                        cards[cardIndex],
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
