import 'package:flutter/material.dart';
import 'package:flutter_recipe_app_course/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app_course/ui/color_styles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("컴포넌트들"),
        ),
        body: ListView(
          children: [
            BigButton(),
          ],
        ),
      ),
    );
  }
}
//Could not create task ':path_provider_android:generateDebugUnitTestConfig'.