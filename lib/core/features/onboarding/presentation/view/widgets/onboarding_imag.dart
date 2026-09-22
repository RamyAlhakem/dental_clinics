import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  final String img;
  const OnboardingImage({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/$img.png");
  }
}
