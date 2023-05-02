import 'package:dummy_education_website/home.dart';
import 'package:dummy_education_website/model/color.model.dart';
import 'package:dummy_education_website/model/fonts.model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: Fonts.regular, primaryColor: AppColors.background),
      home: const HomeScreen(),
    );
  }
}
