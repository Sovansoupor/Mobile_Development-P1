import 'package:flutter/material.dart';

enum Product {
  dart(
    'Dart',
    'The best object language',
    'assets/dart.png',
  ),
  flutter(
    'Flutter',
    'The best mobile widget library',
    'assets/flutter.png',
  ),
  firebase(
    'Firebase',
    'The best cloud database',
    'assets/firebase.png',
  );

  final String title;
  final String description;
  final String imagePath;
  const Product(this.title, this.description, this.imagePath);
}

void main() {
  runApp(
    MaterialApp(
      title: 'ProductCard',
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Product Cards'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: const [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
      ),
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(product.imagePath, width: 100.0, height: 100.0),
              const SizedBox(height: 8.0),
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Flexible(
                child: Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
