import 'package:flutter/material.dart';

class Shoes extends StatefulWidget {
  final String image;
  final String tag;
  final String productName;
  final String brand;

  const Shoes({
    Key? key,
    required this.image,
    required this.tag,
    required this.productName,
    required this.brand,
  }) : super(key: key);

  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  String selectedSize = '7'; // Default shoe size

  // List of available shoe sizes (as numbers)
  final List<String> availableSizes = ['6', '7', '8', '9', '10', '11'];

  // Navigate to Product Summary Page with Payment Option
  void buyNow() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductSummaryPage(
          image: widget.image,
          productName: widget.productName,
          brand: widget.brand,
          size: selectedSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Hero(
          tag: widget.tag,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.image),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 350, // Increased height for size selection
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          widget.brand,
                          style: TextStyle(color: Colors.grey[600], fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        // Size selection dropdown for shoe size
                        Row(
                          children: [
                            Text(
                              'Size:',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            DropdownButton<String>(
                              value: selectedSize,
                              onChanged: (String? newSize) {
                                setState(() {
                                  selectedSize = newSize!;
                                });
                              },
                              items: availableSizes.map<DropdownMenuItem<String>>((String size) {
                                return DropdownMenuItem<String>(
                                  value: size,
                                  child: Text(size),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: buyNow,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: Text('Buy Now'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductSummaryPage extends StatefulWidget {
  final String image;
  final String productName;
  final String brand;
  final String size;

  const ProductSummaryPage({
    Key? key,
    required this.image,
    required this.productName,
    required this.brand,
    required this.size,
  }) : super(key: key);

  @override
  _ProductSummaryPageState createState() => _ProductSummaryPageState();
}

class _ProductSummaryPageState extends State<ProductSummaryPage> {
  String selectedPaymentMethod = 'Cash'; // Default payment method
  final List<String> paymentMethods = ['Cash', 'Card', 'UPI'];

  // Method to confirm payment
  void confirmPayment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('You have paid using $selectedPaymentMethod.\nThank you for your purchase!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to the previous page
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Summary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image, height: 200),
            SizedBox(height: 20),
            Text(
              widget.productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Brand: ${widget.brand}',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              'Selected Size: ${widget.size}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'Choose Payment Method:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: selectedPaymentMethod,
              onChanged: (String? newMethod) {
                setState(() {
                  selectedPaymentMethod = newMethod!;
                });
              },
              items: paymentMethods.map<DropdownMenuItem<String>>((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: confirmPayment,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.blue,
                ),
                child: Text('Proceed to Payment', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
