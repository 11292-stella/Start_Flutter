import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 255, 249, 249),
        fontSize: 28.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
