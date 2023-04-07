import 'package:flutter/material.dart';

class DeliveringLogo extends StatelessWidget {
  const DeliveringLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/delivering.gif',
      height: 250,
      width: 250,
      fit: BoxFit.contain,
    );
  }
}
