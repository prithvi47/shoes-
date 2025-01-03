import 'package:flutter/material.dart';

class ProductSummaryPage extends StatelessWidget {
  final String image;
  final String productName;
  final String brand;
  final void Function() onConfirmAddToCart;

  const ProductSummaryPage({
    Key? key,
    required this.image,
    required this.productName,
    required this.brand,
    required this.onConfirmAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Summary'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              productName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              brand,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                onConfirmAddToCart();
                Navigator.pop(context); // Return to the previous screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'Confirm Add to Cart',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
