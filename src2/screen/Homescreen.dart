import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> _items = [
    Item(
      title: 'Chicago Style',
      image:
          'https://img.favpng.com/11/9/16/chicago-style-pizza-italian-cuisine-vegetarian-cuisine-neapolitan-pizza-png-favpng-HsJ8XDH8qgZnysXx50pggC9St.jpg',
      icon: Icons.local_pizza,
    ),
    Item(
      title: 'Pepperoni Pizza',
      image:
          'https://w1.pngwing.com/pngs/655/761/png-transparent-pepperoni-pizza-vegetarian-cuisine-soppressata-sicilian-pizza-italian-cuisine-salami-ham-cheese.png',
      icon: Icons.local_pizza,
    ),
    Item(
      title: '',
      image: '',
      icon: Icons.local_pizza,
    ),
    Item(
      title: 'Mercedes',
      image:
          'https://st3.depositphotos.com/3761483/14435/i/600/depositphotos_144350333-stock-photo-mercedes-benz-logo.jpg',
      icon: Icons.directions_car,
    ),
    Item(
      title: 'BMW',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIjHIgtJ1BYPrzdNJ2YFeM3Cko9V2hxp1gWg&usqp=CAU',
      icon: Icons.directions_car,
    ),
    Item(
      title: 'Flamingo',
      image:
          'https://static.vecteezy.com/system/resources/previews/003/609/770/original/flamingo-logo-template-design-icon-illustration-vector.jpg',
      icon: Icons.pets,
    ),
  ];
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: Column(
        children: [
          // display selected item
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50),
            color: const Color.fromARGB(255, 51, 53, 65),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.network(
                  _items[_selectedItemIndex].image,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 10),
                Text(
                  _items[_selectedItemIndex].title,
                  style: const TextStyle(fontSize: 32, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Icon(
                  _items[_selectedItemIndex].icon,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                width: double.infinity,
                color: const Color.fromARGB(31, 234, 78, 132),
                child: ListWheelScrollView(
                  itemExtent: 100,
                  diameterRatio: 1.8,
                  onSelectedItemChanged: (int index) {
                    setState(() {
                      _selectedItemIndex = index;
                    });
                  },
                  // children of the list
                  children: _items
                      .map((e) => Card(
                            // make selected item background color differ from the rest
                            color: _items.indexOf(e) == _selectedItemIndex
                                ? Colors.orange
                                : Colors.indigo,
                            child: InkWell(
                              onTap: () {
                                // Handle button click for each item
                                print('${e.title} clicked');
                              },
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      e.image,
                                      height: 20,
                                      width: 50,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      e.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Icon(
                                      e.icon,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                )),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String title;
  final String image;
  final IconData icon;

  Item({
    required this.title,
    required this.image,
    required this.icon,
  });
}
