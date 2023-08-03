import 'package:flutter/material.dart';
import 'package:onboarding/screen/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'onboarding Screen',
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
   );
  }
}
