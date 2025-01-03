import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  final String productName;
  final double productPrice;
  final String selectedSize;
  int quantity;

  BuyPage({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.selectedSize,
    required this.quantity,
  }) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.productPrice * widget.quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Page"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Product Summary Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product: ${widget.productName}", style: TextStyle(fontSize: 18)),
                  Text("Price: \$${widget.productPrice.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
                  Text("Size: ${widget.selectedSize}", style: TextStyle(fontSize: 16)),
                  Text("Quantity: ${widget.quantity}", style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 30),

              // Quantity Adjustment
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (widget.quantity > 1) {
                        setState(() {
                          widget.quantity--;
                        });
                      }
                    },
                  ),
                  Text(widget.quantity.toString(), style: TextStyle(fontSize: 18)),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        widget.quantity++;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Payment Method Selection
              Text(
                "Select Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Dropdown to select payment method
              DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(value: 'Credit Card', child: Text('Credit Card')),
                  DropdownMenuItem<String>(value: 'PayPal', child: Text('PayPal')),
                  // Add other payment options as needed
                ],
                onChanged: (String? value) {
                  // Handle payment method selection
                },
                hint: Text("Select Payment Method"),
              ),
              SizedBox(height: 30),

              // Card details form
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Card Number'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Expiry Date'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'CVV'),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Total Price
              Text(
                "Total: \$${totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // Purchase Button
              ElevatedButton(
                onPressed: () {
                  // Implement purchase action
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Purchase successful!')));
                },
                child: Text("Confirm Purchase"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
