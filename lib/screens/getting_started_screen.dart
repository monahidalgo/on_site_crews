import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({super.key});

  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  final PageController _pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = (index == 3); // Check if it's the last page
                  });
                },
                children: [
                  buildPage(
                    icon: Icons.construction,
                    title: "Welcome to OSC",
                    description: "Manage all your construction sites efficiently with our comprehensive tool.",
                    imagePath: 'assets/images/construction_site_1.png', // Image path
                  ),
                  buildPage(
                    icon: Icons.timeline,
                    title: "Track Projects",
                    description: "Stay on top of your projects, tasks, and reports in real-time.",
                    imagePath: 'assets/images/construction_site_2.png', // Image path
                  ),
                  buildPage(
                    icon: Icons.inventory,
                    title: "Manage Inventory",
                    description: "Ensure you have the materials you need when you need them.",
                    imagePath: 'assets/images/construction_site_3.png', // Image path
                  ),
                  buildPage(
                    icon: Icons.engineering,
                    title: "Simplify Site Management",
                    description: "Streamline operations with OSC and focus on what matters most.",
                    imagePath: 'assets/images/construction_site_4.png', // Image path
                  ),
                ],
              ),
            ),
            // Page indicator
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.orange,
                ),
              ),
            ),
            // Next or Get Started button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isLastPage
                  ? ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 40.0),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Roboto'),
                ),
              )
                  : TextButton(
                onPressed: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blueGrey,
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 16, fontFamily: 'Roboto'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated buildPage method with icon
  Widget buildPage({
    required IconData icon,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon section
          Icon(
            icon,
            size: 50,
            color: Colors.orange,
          ),
          const SizedBox(height: 16.0),
          /* Uncomment the image section when ready
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          );
          */
          const SizedBox(height: 24.0),
          // Title and description
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
