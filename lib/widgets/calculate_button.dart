import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CalculateButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple,
      textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder()
    ), 
    child: Text('Calculate'),);
  }
}
