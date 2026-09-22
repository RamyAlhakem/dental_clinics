import 'package:flutter/material.dart';

class SignWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SignWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}
