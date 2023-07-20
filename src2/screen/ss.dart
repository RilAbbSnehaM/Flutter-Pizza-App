import 'package:flutter/material.dart';

class Pizza {
  final String name;
  final String description;
  final double price;

  Pizza({required this.name, required this.description, required this.price});
}

class HotDealsPage extends StatelessWidget {
  final List<Pizza> pizzas = [
    Pizza(
      name: 'Margherita',
      description: 'Classic tomato and mozzarella cheese',
      price: 9.99,
    ),
    Pizza(
      name: 'Pepperoni',
      description: 'Spicy pepperoni and mozzarella cheese',
      price: 11.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot Deals'),
      ),
      body: ListView.builder(
        itemCount: pizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pizzas[index].name),
            subtitle: Text(pizzas[index].description),
            trailing: Text('\$${pizzas[index].price.toStringAsFixed(2)}'),
            onTap: () {
              _addToCart(context, pizzas[index]);
            },
          );
        },
      ),
    );
  }

  void _addToCart(BuildContext context, Pizza pizza) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${pizza.name} added to cart')),
    );
  }
}
