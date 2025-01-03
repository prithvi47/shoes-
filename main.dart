import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'Shoes.dart';
import 'PurchaseSummaryPage.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ),
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "All";

  final Map<String, List<Map<String, String>>> categoryItems = {
    "All": [
      {"image": 'assets/images/one.jpg', "title": "Nike CourtLite", "brand": "Nike"},
      {"image": 'assets/images/two.jpg', "title": "Adidas Ease", "brand": "Adidas"},
      {"image": 'assets/images/three.jpg', "title": "Nike Air Max", "brand": "Nike"},
    ],
    "Football": [
      {"image": 'assets/images/f0.jpg', "title": "Adidas Al Rihla", "brand": "Adidas"},
      {"image": 'assets/images/f2.jpg', "title": "Adidas Nativo", "brand": "Adidas"},
      {"image": 'assets/images/f3.jpg', "title": "Nike Mercurial Superfly", "brand": "Nike"},
    ],
    "Oxford": [
      {"image": 'assets/images/o1.jpg', "title": "Black Cobalt", "brand": "Oxford Brand"},
      {"image": 'assets/images/o2.jpg', "title": "Windsor Oxfords", "brand": "Oxford Brand"},
    ],
    "Loafer": [
      {"image": 'assets/images/l1.jpg', "title": "Black Formal", "brand": "Loafer Brand"},
      {"image": 'assets/images/l2.jpg', "title": "Navy Loafer", "brand": "Loafer Brand"},
    ],
    "Boots": [
      {"image": 'assets/images/b1.jpg', "title": "Fenland Black", "brand": "Boots Brand"},
      {"image": 'assets/images/b2.jpg', "title": "Leather Bordeaux", "brand": "Boots Brand"},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Shoes",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Navigate to PurchaseSummaryPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PurchaseSummaryPage(
                    summary: "Your purchase includes 3 items: Nike CourtLite, Adidas Ease, and Nike Air Max.",
                  ),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categoryItems.keys.map((category) {
                    return FadeInUp(
                      duration: Duration(milliseconds: 1300),
                      child: _buildCategoryItem(category),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              ...categoryItems[selectedCategory]!.asMap().entries.map((entry) {
                int index = entry.key;
                var shoe = entry.value;
                return ZoomIn(
                  duration: Duration(milliseconds: 1000 + index * 100),
                  child: _buildShoeItem(
                    context,
                    shoe["image"]!,
                    shoe["title"]!,
                    shoe["brand"]!,
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selectedCategory == title ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              color: selectedCategory == title ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShoeItem(BuildContext context, String image, String title, String brand) {
    return Hero(
      tag: title, // Use title as the unique tag for the hero transition
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Shoes(
                image: image,
                tag: title,
                productName: title,
                brand: brand,
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: 250,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeIn(
                  duration: Duration(milliseconds: 1200),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FadeInUp(
                  duration: Duration(milliseconds: 1200),
                  child: Text(
                    brand,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
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
