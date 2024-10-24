import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

            child:  Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 35,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
            ),
          )
          ],   
    ),
    ),
    );
  }
}

void main() {
  runApp(const 
    CustomCard(title:"Flutter"),

  );
}