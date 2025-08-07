import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 136, 61, 211),
        title: Text(
          'GPA Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body:Column(
        children: [
          Text('Your Semester',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          TextField(
            decoration: InputDecoration(),
          )

        ],
      ),
    );
  }
}
