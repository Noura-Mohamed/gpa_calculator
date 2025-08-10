import 'package:flutter/material.dart';

class GradeButton extends StatelessWidget {
  final Function(String)? onGradeSelected;
  const GradeButton({super.key, this.onGradeSelected});

  @override
  Widget build(BuildContext context) {
    final List<String> grades = [
      'A+',
      'A',
      'A-',
      'B+',
      'B',
      'B-',
      'C+',
      'C',
      'C-',
      'D+',
      'D',
      'D-',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 237, 209, 243),
          hintText: 'Grade',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purpleAccent, width: 2),
          ),
        ),
        items: grades.map((category) {
          return DropdownMenuItem(value: category, child: Text(category));
        }).toList(),
        onChanged: (String? value) {
          if (value != null && onGradeSelected != null) {
            onGradeSelected!(value);
          }
        },
      ),
    );
  }
}
