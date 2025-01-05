import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/medium_button.dart';
import 'package:flutter_recipe_app_course/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  final void Function() onTapStartCooking;

  const SplashScreen({
    super.key,
    required this.onTapStartCooking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/splash_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 104,
                ),
                Image.asset(
                  'assets/image/crown.png',
                  width: 79,
                  height: 79,
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(
                  "100K+ Premium Recipe ",
                  style: TextStyles.mediumTextBold.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 213,
                  child: Text(
                    "Get Cooking",
                    style: TextStyles.headerTextBold
                        .copyWith(color: Colors.white, fontSize: 48),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Simple way to find Tasty Recipe",
                  style: TextStyles.normalTextRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 64,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 66),
                  child: MediumButton(
                    "Start Cooking",
                    onPressed: onTapStartCooking,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
