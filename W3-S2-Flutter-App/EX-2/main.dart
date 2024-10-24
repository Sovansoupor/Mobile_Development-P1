import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(50),
      color: const Color(0xff04e3f3),
     child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: const Center(
            child: Text(
              "CADT STUDENTS",
            style: TextStyle(
              decoration: TextDecoration.none,
            color: Colors.white,
            fontSize: 40,
          )
            ),
     ),
    )
  )
  ));
}
