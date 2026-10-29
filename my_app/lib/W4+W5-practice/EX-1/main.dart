import 'package:flutter/material.dart';

void main() {
  runApp(const Exercise1());
}

class Exercise1 extends StatelessWidget {
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Hello my name is Ronan!',
            style: TextStyle(color: Colors.orange, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
