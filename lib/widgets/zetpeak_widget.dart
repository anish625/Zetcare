import 'package:flutter/material.dart';

class ZetpeakLogo extends StatelessWidget {
  const ZetpeakLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/zetpeak_logo.png'),
        ),
        Text(
          "POWERED BY ZETPEAK",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
