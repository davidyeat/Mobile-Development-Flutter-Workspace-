import 'package:flutter/material.dart';

void main() {
  runApp(const Exercise2());
}

class Exercise2 extends StatelessWidget {
  const Exercise2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        color: Colors.blue[300],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              'cadt student'.toUpperCase(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
