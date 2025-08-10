import 'package:flutter/material.dart';

class AddCourse extends StatelessWidget {
  final VoidCallback onPressed;
  const AddCourse({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.deepPurple,
          padding: EdgeInsets.all(0),
          iconSize: 25,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(color: Colors.purpleAccent, width: 3),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text('+ Add Course',
          style: TextStyle(fontSize: 20,
          fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
