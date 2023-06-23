import 'package:flutter/material.dart';

class FurnitureProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 800,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://atlas-content-cdn.pixelsquid.com/stock-images/mid-century-modern-chair-WyLz5ZC-600.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 30,
                    ),
                    color: const Color.fromARGB(255, 0, 0, 0),
                    onPressed: () {
                      print("Back");
                      // Add your logic for navigating back here
                    },
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  height: 15,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                    ),
                    color: const Color.fromARGB(255, 0, 0, 0),
                    onPressed: () {
                      print('Like');
                      // Add your logic for handling favorite action here
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 67, 76, 82),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elegant Sofa',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Price: \$399',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 20,
                            height: 20,
                            child: InkWell(
                              onTap: () {
                                print('Button pressed');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 20,
                            height: 20,
                            child: InkWell(
                              onTap: () {
                                print('Button pressed');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 124, 229, 138),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 20,
                            height: 20,
                            child: InkWell(
                              onTap: () {
                                print('Button pressed');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 252, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Wooden Chair with purely made from wood.',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Container(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              print("Add to Cart");
                              // Add your logic for adding to cart here
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
