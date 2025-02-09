import 'package:flutter/material.dart';
import 'package:ass1_task2/Details.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsPage();
}

class _ProductsPage extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu_open_outlined),
            onPressed: () {
              // Handle menu action
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                // Handle cart action
              },
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(  // ✅ Added Scrolling to avoid overflow
          child: Column(
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "What Kind\nof Plants you want",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 2))
                    ]),
                child: TextField(
                  style: TextStyle(color: Colors.grey[500]),
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Icon(Icons.mic, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryText('All', isSelected: true),
                  categoryText('Small'),
                  categoryText('Medium'),
                  categoryText('Hanging'),
                ],
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  buildBox("Ficus", '\$15', "images/Ficus.png", context),
                  buildBox("Cactus", '\$15', "images/Cactus.png", context),
                  buildBox("Samantha", '\$15', "images/Samantha.png", context),
                  buildBox("Alvera", '\$15', "images/Alvera.png", context),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Text Widget for Categories
Widget categoryText(String text, {bool isSelected = false}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: isSelected ? Colors.green[600] : Colors.black,
    ),
  );
}

// ✅ Fixed Box Widget with Flexible Layout
Widget buildBox(String plantName, String price, String imgUrl, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DetailsPage(name: plantName, price: price, imageUrl: imgUrl),
        ),
      );
    },
    child: Container(
      width: MediaQuery.of(context).size.width * 0.42,  // ✅ Responsive Width
      height: 200,  // ✅ Adjusted Height to avoid overflow
      decoration: BoxDecoration(
        color: Colors.green[700],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Indoor',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Icon(Icons.favorite_border, color: Colors.white),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(  // ✅ Auto-adjust Image Size
            child: Center(
              child: Image.asset(
                imgUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plantName,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "From $price",
                      style: TextStyle(
                          fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
