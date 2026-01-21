import 'package:flutter/material.dart';
import 'package:movieexplorer/screens/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  final PageController _controller = PageController();

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onboarding_initial.png",
      "title": "Catch Every\n Blockbuster Without\n the Queue",
    },
    {
      "image": "assets/images/onboarding_secondary.png",
      "title": "Because\nMoviesDeserve\nMore Than Queues",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            itemBuilder: (_, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(pages[index]['image']!, fit: BoxFit.cover),
                  // Gradient overlay at bottom
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 800,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            // Transparent top
                            Colors.transparent,
                            // Solid color bottom
                            Color(0xFF9C9F8E).withOpacity(0.43),
                            Color(0xFF9C9F8E).withOpacity(1),
                            Color(0xFF9C9F8E).withOpacity(1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 140,
                    left: 24,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pages[index]['title']!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          /// Bottom button
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color(0xFF9C9F8E).withOpacity(0.43),
                  shadowColor: Color(0xFF9C9F8E).withOpacity(0.43),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (currentIndex == pages.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomeScreen()),
                    );
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Center(
                  child: Text(
                    currentIndex == pages.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
