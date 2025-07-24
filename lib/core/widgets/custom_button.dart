import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF926AFF), // Màu nền
        foregroundColor: Colors.white, // Màu chữ và hiệu ứng khi nhấn
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 12,
        ), // Padding
        textStyle: const TextStyle(fontWeight: FontWeight.normal), // Style chữ
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4), // Bo góc
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
