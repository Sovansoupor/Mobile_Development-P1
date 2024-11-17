import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];
void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner in development mode
      home: ImageViewerPage(),
    ));

class ImageViewerPage extends StatefulWidget {
  const ImageViewerPage({super.key});

  @override
  State<ImageViewerPage> createState() => _ImageViewerPageState();
}

class _ImageViewerPageState extends State<ImageViewerPage> {
  List<String> images = [
    "assets/bird.jpg",
    "assets/bird2.jpg",
    "assets/insect.jpg",
    "assets/girl.jpg",
    "assets/man.jpg",
  ];
  int currentIndex = 0;

  void changeImage(int delta) {
    setState(() {
      currentIndex = (currentIndex + delta) % images.length;
      if (currentIndex < 0) currentIndex = images.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          // previous button
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () {
              changeImage(-1);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () {
                changeImage(1);
              },
            ),
          ),
        ],
      ),
     body: Image.asset(images[currentIndex]),
    );
  }
}
