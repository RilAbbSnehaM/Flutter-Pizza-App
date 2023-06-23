import 'package:flutter/material.dart';
import 'package:project/src2/screen/OrderScreen.dart';

class Margerita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Margerita Pizza🍕'),
        ),
        body: const SingleChildScrollView(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            PizzaSpecialCard(
              image: 'assets/images/margerita.jpeg',
              title: 'Margerita Pizza 🍕',
              description: 'Margerita Pizza 🍕 with extra layered cheese.',
              rating: 4,
            ),
          ]),
        )));
  }
}

class PizzaSpecialCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int rating;

  const PizzaSpecialCard({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
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
