import 'package:flutter/material.dart';

class Pizza {
  final String name;
  final String imageUrl;
  final double price;

  Pizza({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class Cart {
  final List<Pizza> cartItems;

  Cart({required this.cartItems});
}

class CartPage extends StatelessWidget {
  final List<Pizza> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(cartItems[index].imageUrl),
            title: Text(cartItems[index].name),
            subtitle: Text('\$${cartItems[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
