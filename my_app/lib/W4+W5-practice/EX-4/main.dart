import 'package:flutter/material.dart';

void main() {
  runApp(const Exercise4());
}

class Exercise4 extends StatelessWidget {
  const Exercise4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Container(color: Colors.blue, height: 400),
            Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.green)),
                  Container(color: Colors.pink, width: 100),
                ],
              ),
            ),
            Container(
              height: 100,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Container(color: Colors.yellow)),
                  const SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.yellow)),
                  const SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.yellow)),
                  // Container(color: Colors.yellow, width: 100),
                  // Container(color: Colors.yellow, width: 100),
                  // Container(color: Colors.yellow, width: 100)
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: Container(color: Colors.pink)),
          ],
        ),
      ),
    );
  }
}
