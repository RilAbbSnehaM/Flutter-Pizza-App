import 'package:flutter/material.dart';
import 'package:project/src2/screen/OrderScreen.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    print("Search");
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onSubmitted: (String searchQuery) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchResultPage(searchQuery: searchQuery),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SearchResultPage extends StatelessWidget {
  final String searchQuery;

  const SearchResultPage({required this.searchQuery, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pizzaData = fetchPizzaData(searchQuery);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: pizzaData.length,
        itemBuilder: (context, index) {
          final pizza = pizzaData[index];
          return ListTile(
            leading: Image.asset(
              pizza.imagePath,
              width: 50,
              height: 50,
            ),
            title: Text(pizza.name),
            subtitle: Text(pizza.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetailsPage(pizza: pizza),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PizzaDetailsPage extends StatelessWidget {
  final Pizza pizza;

  const PizzaDetailsPage({required this.pizza, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pizza.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pizza.imagePath,
            width: 200,
            height: 200,
          ),
          Text(pizza.description),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderPage(
                    pizza: pizza,
                    userOrders: [],
                  ),
                ),
              );
            },
            child: Text('Order Pizza'),
          ),
        ],
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  final Pizza pizza;

  const OrderPage(
      {required this.pizza, Key? key, required List<String> userOrders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Pizza'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order ${pizza.name}'),
            Text('Price: \$${pizza.price}'),
            ElevatedButton(
              onPressed: () {
                print('Order placed for ${pizza.name}');
              },
              child: Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

class Pizza {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Pizza({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

List<Pizza> fetchPizzaData(String searchQuery) {
  return [
    Pizza(
      name: 'Margherita',
      description: 'Classic cheese pizza',
      price: 200,
      imagePath: 'assets/images/margerita.jpeg',
    ),
    Pizza(
      name: 'Pepperoni',
      description: 'Pizza topped with pepperoni slices',
      price: 400,
      imagePath: 'assets/images/Pepperoni.jpeg',
    ),
    Pizza(
      name: 'Vegetarian',
      description: 'Pizza loaded with vegetables',
      price: 600,
      imagePath: 'assets/images/Vege.jpeg',
    ),
  ];
}
