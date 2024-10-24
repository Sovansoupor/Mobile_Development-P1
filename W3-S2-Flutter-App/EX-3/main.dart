import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Center(
        child: Column(
          children: [
            Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue[100], 
            ),

            child: const Center(
              child: Text(
                'OOP',
                style: TextStyle(
                  fontSize: 35,
                  decoration: TextDecoration.none,
                  color: Colors.white,

                ),
              ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue[300], 
            ),

            child: const Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(
                  fontSize: 35,
                  decoration: TextDecoration.none,
                  color: Colors.white,

                ),
              ),
            ),
          ),
          
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
              colors: [Color(0xff4e7df5) ,Color.fromARGB(255, 5, 34, 109)])
            ),
            child: const Center(
              child: Text(
                'DART',
                style: TextStyle(
                  fontSize: 35,
                  decoration: TextDecoration.none,
                  color: Colors.white,

                ),
              ),
            ),
          )],

        ),
      )
    ),
  );
}