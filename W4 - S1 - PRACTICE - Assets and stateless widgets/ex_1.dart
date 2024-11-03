import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text('My Hobbies'),
          centerTitle: false,
        ),
        body: const Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //hobby card
              HobbyCard(
                icon: Icons.travel_explore,
                hobby: 'Travelling',
              ),
              HobbyCard(
                icon: Icons.museum,
                hobby: 'Museum',
              )
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String hobby;

  const HobbyCard({
    required this.icon,
    required this.hobby,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
            ),
            Text(
              hobby,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
