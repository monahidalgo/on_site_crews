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
  bool isTapped = false; // Track text click state

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
                    isTapped = false; // Reset text color when changing pages
                  });
                },
                children: [
                  buildPage(
                    icon: Icons.construction,
                    title: "Welcome to OSC",
                    description:
                        "Manage all your construction sites efficiently with our comprehensive tool.",
                    imagePath:
                        'assets/images/construction_site_1.png', // Image path
                  ),
                  buildPage(
                    icon: Icons.timeline,
                    title: "Track Projects",
                    description:
                        "Stay on top of your projects, tasks, and reports in real-time.",
                    imagePath:
                        'assets/images/construction_site_2.png', // Image path
                  ),
                  buildPage(
                    icon: Icons.inventory,
                    title: "Manage Inventory",
                    description:
                        "Ensure you have the materials you need when you need them.",
                    imagePath:
                        'assets/images/construction_site_3.png', // Image path
                  ),
                  buildPage(
                    icon: Icons.engineering,
                    title: "Simplify Site Management",
                    description:
                        "Streamline operations with OSC and focus on what matters most.",
                    imagePath:
                        'assets/images/construction_site_4.png', // Image path
                  ),
                ],
              ),
            ),
            // Page indicator with WormEffect
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 4,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.orange,
                  spacing: 8.0,
                ),
              ),
            ),
            // Next or Get Started button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isLastPage
                  ? ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Get Started'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Button color
                        foregroundColor: Colors.white, // Text color
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 40.0),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
                        foregroundColor: Colors.orange, // Text color for 'Next'
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

  // Page structure with enlarged icons and clickable text
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
          // Enlarged Icon
          Icon(
            icon,
            size: 90, // Larger icon size
            color: Colors.redAccent,
          ),
          const SizedBox(height: 16.0),
          // Image section (commented out for now)
          /* Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 250, // Adjust for desired display
            width: double.infinity,
          ), */
          const SizedBox(height: 24.0),
          // Title with click color change
          InkWell(
            onTap: () {
              setState(() {
                isTapped = true;
              });
            },
            child: Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: isTapped ? Colors.blue : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16.0),
          // Description text
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
