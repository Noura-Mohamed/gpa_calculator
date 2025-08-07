import 'package:flutter/material.dart';
import 'package:gba_calculator/views/home_page.dart';
import 'package:gba_calculator/widgets/next_photo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  final List<String> images = [
    'assets/6940958.jpg',
    'assets/6941616.jpg',
    'assets/6942031.jpg',
  ];

  final List<String> text = [
    'Track your academic progress with ease',
    'Add your courses in seconds',
    'See your growth, stay motivated',
  ];

  void nextPage(BuildContext context) {
    if (currentIndex.value < images.length - 1) {
      controller.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: images.length,
              onPageChanged: (index) {
                currentIndex.value = index;
              },
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(images[index], height: 300),
                    SizedBox(height: 30),
                    Text(
                      textAlign: TextAlign.center,
                      text[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ValueListenableBuilder<int>(
            valueListenable: currentIndex,
            builder: (context, index, _) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                images.length,
                (i) => NextPhoto(isActive: index == i),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ValueListenableBuilder<int>(
            valueListenable: currentIndex,
             builder: (context, index, _)=>ElevatedButton(
              onPressed: ()=>nextPage(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16)
              ),
               child: Text(
                index==images.length-1?'Get Started':'Continue',
                style: TextStyle(color: Colors.white),
               ))),
               SizedBox(height: 80,)
        ],
      ),
    );
  }
}
