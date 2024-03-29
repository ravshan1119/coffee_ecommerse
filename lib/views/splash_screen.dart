import 'package:coffee_ecommerse/components/image_slider.dart';
import 'package:coffee_ecommerse/components/main_button.dart';
import 'package:coffee_ecommerse/theme.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/wallpaper.jpg'))),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              height: size.height / 2,
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const SingleChildScrollView(child: ImageSlider());
                },
                itemCount: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: AppTheme.primaryColor,
                  dotColor: AppTheme.darkColor.withOpacity(0.3),

                  dotHeight: 12,
                  dotWidth: 12,
                  type: WormType.normal,
                  // strokeWidth: 5,
                ),
              ),
            ),
            const Spacer(),
            const MainButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
