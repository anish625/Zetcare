import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  const RoundButton({Key? key,
    required this.title,
    required this.onTap,
    this.loading=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 49,
        decoration: BoxDecoration(
          color: Colors.red[700],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: loading ?
          const CircularProgressIndicator(strokeWidth: 3, color: Colors.white,):
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
