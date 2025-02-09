import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String price;

  const DetailsPage(
      {super.key,
      required this.name,
      required this.price,
      required this.imageUrl});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          )
        ],
      ), // Displays plant name in AppBar
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 30), // Padding for left alignment
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the left
          children: [
            // Image Container (60% height)
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imageUrl),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),

            SizedBox(height: 20), // Space between image and text

            // Plant Name
            Text(
              widget.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5), // Space between name and price

            // Price
            Text(
              "Regular Price ${widget.price}",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Aligns counter & stars
              children: [
                // Increment & Decrement Row
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // if (quantity > 1) {
                        //   setState(() {
                        //     quantity--;
                        //   });
                        // }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "$quantity",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   quantity++;
                        // });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                // ⭐ Star Ratings
                Row(
                  children: List.generate(5, (index) {
                    return Icon(Icons.star, color: Colors.amber, size: 20);
                  }),
                ),
              ],
            ),
            SizedBox(height: 20), // Space before description

            // Description Text
            Text(
              "This is a beautiful ${widget.name}. It’s perfect for indoor decoration and provides fresh air.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
