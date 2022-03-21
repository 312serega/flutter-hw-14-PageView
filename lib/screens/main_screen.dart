import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller =
      PageController(viewportFraction: 0.8, keepPage: true, initialPage: 1);

  final List<Widget> item = [
    Container(
      width: double.infinity,
      color: Colors.amber,
    ),
    Container(
      width: double.infinity,
      color: Colors.brown,
    ),
    Container(
      width: double.infinity,
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('text'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
                controller: controller,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return item[index];
                }),
          ),
          const SizedBox(height: 30),
          SmoothPageIndicator(
            controller: controller,
            count: item.length,
            effect: const WormEffect(
              dotHeight: 16,
              dotWidth: 16,
              type: WormType.thin,
              // strokeWidth: 5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
