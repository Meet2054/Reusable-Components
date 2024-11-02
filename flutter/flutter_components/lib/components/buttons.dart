import 'package:flutter/material.dart';

class AnimatedButtons extends StatefulWidget {
  const AnimatedButtons({super.key});

  @override
  AnimatedButtonsState createState() => AnimatedButtonsState();
}

class AnimatedButtonsState extends State<AnimatedButtons>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  bool _isPulsing = false;
  double _scale = 1.0;
  bool _flip = false;
  bool _slideIn = false;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _isPulsing = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("Animated Buttons Demo",
            style: TextStyle(color: Colors.white)),
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            // Ripple Effect Button
            InkWell(
              onTap: () {},
              splashColor: Colors.blue.withOpacity(0.4),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Ripple Effect",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // Glow or Pulse Animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple,
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(_isPulsing ? 0.8 : 0.0),
                    blurRadius: _isPulsing ? 10 : 0,
                    spreadRadius: _isPulsing ? 5 : 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPulsing = !_isPulsing;
                  });
                },
                child: const Text(
                  "Glow/Pulse",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            // Color Shifting Gradient Button
            TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.orange, end: Colors.red),
              duration: const Duration(seconds: 2),
              builder: (context, color, _) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color as Color, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Color Shift",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),

            // Bounce Animation
            GestureDetector(
              onTapDown: (_) => setState(() => _scale = 0.9),
              onTapUp: (_) => setState(() => _scale = 1.0),
              child: Transform.scale(
                scale: _scale,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Bounce",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

            // Loading Indicator within Button
            GestureDetector(
              onTap: () {
                setState(() {
                  _isLoading = !_isLoading;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "Loading Button",
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),

            // Flip Animation Button
            GestureDetector(
              onTap: () {
                setState(() {
                  _flip = !_flip;
                });
              },
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: _flip ? 1 : 0),
                duration: const Duration(milliseconds: 500),
                builder: (context, value, child) {
                  // Calculate the angle for the flip effect
                  double angle = value * 3.14159; // Radians (180 degrees)

                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(angle),
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Transform(
                        alignment: Alignment.center,
                        transform:
                            Matrix4.rotationY(angle), // Rotate text as well
                        child: Text(
                          _flip ? "Back" : "Flip",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Slide In Icon Button
            GestureDetector(
              onTap: () {
                setState(() {
                  _slideIn = !_slideIn;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSlide(
                    duration: const Duration(milliseconds: 500),
                    offset: Offset(_slideIn ? 0 : -1, 0),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Slide In Icon",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),

            // Dark Mode Toggle Button
            GestureDetector(
              onTap: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              child: Container(
                width: 100,
                height: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[800] : Colors.yellow[600],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      alignment: isDarkMode
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.grey[800]
                              : Colors.yellow[600],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDarkMode ? Colors.white : Colors.orange,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isDarkMode ? Colors.white : Colors.orange,
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
