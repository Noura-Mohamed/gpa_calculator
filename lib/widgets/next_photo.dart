import 'package:flutter/material.dart';

class NextPhoto extends StatelessWidget {
  const NextPhoto({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 10,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isActive? Color.fromARGB(255, 136, 61, 211): Colors.grey,
        ),
      ),
    );
  }
}
