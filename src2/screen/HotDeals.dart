import 'package:flutter/material.dart';
import 'package:project/src2/screen/Cart.dart';

class HotDealsPage extends StatefulWidget {
  const HotDealsPage({Key? key}) : super(key: key);

  @override
  _HotDealsPageState createState() => _HotDealsPageState();
}

class _HotDealsPageState extends State<HotDealsPage> {
  List<Pizza> pizzas = [
    Pizza(
      name: 'Buy 1 get 1 Pizza',
      imageUrl: 'assets/images/buyo.jpg',
      price: 10.99,
    ),
    Pizza(
      name: '50% off on all Pizza',
      imageUrl: 'assets/images/50.png',
      price: 9.99,
    ),
    Pizza(
      name: 'Family Pizza',
      imageUrl: 'assets/images/fam.jpg',
      price: 12.99,
    ),
  ];

  List<Pizza> cartItems = [];

  void addToCart(Pizza pizza) {
    setState(() {
      cartItems.add(pizza);
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hot Deals'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: pizzas.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(8.0),
                leading: Container(
                  width: 400.0,
                  height: 400.0,
                  child: Image.network(pizzas[index].imageUrl),
                ),
                title: Text(
                  pizzas[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Make text bold
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    addToCart(pizzas[index]);
                  },
                  child: Text('Add to Cart'),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cartItems: cartItems),
            ),
          );
        },
        icon: Icon(Icons.shopping_cart),
        label: Text('View Cart'),
      ),
    );
  }
}
