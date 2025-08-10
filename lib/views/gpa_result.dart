import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class GpaResultPage extends StatelessWidget {


  const GpaResultPage({super.key,});

  @override
  Widget build(BuildContext context) {
    final Box gpaBox = Hive.box('gpa_box');
    final double gpa = gpaBox.get('last_gpa', defaultValue: 0.0);
    final String semesterName = gpaBox.get(
      'last_semester',
      defaultValue: 'Unknown Semester',
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Result'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Semester: $semesterName',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple.shade700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your GPA is:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              gpa.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
