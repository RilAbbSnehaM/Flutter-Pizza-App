import 'package:flutter/material.dart';
import 'package:project/src2/screen/OrderScreen.dart';

class PizzaSpecialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizza Specials🍕'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PizzaSpecialCard(
                image: 'assets/images/burger.jpeg',
                title: 'Burger 🍔',
                description: 'Delicious Burger with extra cheese.',
                rating: 4,
                price: 200,
              ),
              PizzaSpecialCard(
                image: 'assets/images/Hot-Dog-PNG-Pic.png',
                title: 'Hot Dog 🌭',
                description: 'Hot Dog with extra sausage.',
                rating: 5,
                price: 300,
              ),
              PizzaSpecialCard(
                image: 'assets/images/lollipop.jpeg',
                title: 'lollipop 🍗',
                description: 'lollipop with extra cheese.',
                rating: 5,
                price: 400,
              ),
              PizzaSpecialCard(
                image: 'assets/images/noodles.jpg',
                title: 'Chowmien 🍜',
                description: 'Chowmien with extra masala.',
                rating: 5,
                price: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PizzaSpecialCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int rating;
  final int price;

  const PizzaSpecialCard({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 400,
            width: 400,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 5),
                Text('price:$price',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '$rating/5',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => OrderScreen()));
                  },
                  child: Text('Order Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
