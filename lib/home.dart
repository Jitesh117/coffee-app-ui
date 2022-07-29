import 'package:coffee_ui/util/coffee_tile.dart';
import 'package:coffee_ui/util/coffee_types.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffe types

  final List coffeeTypes = [
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Milk coffee',
      false,
    ],
  ];

  //user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add_rounded),
            label: '',
          )
        ],
      ),
      body: Column(
        children: [
          //Find the best coffee for you
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
              ),
              // style: TextStyle(
              //   fontSize: 36,
              // ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          //Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  hintText: 'Find your Coffee...'),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          // horizontal listview of coffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return CoffeeType(
                    coffeeType: coffeeTypes[index][0],
                    isSelected: coffeeTypes[index][1],
                    onTap: () => coffeeTypeSelected(index));
              },
            ),
          ),

          //horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  coffeImagePath: 'assets/coffetwo.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '\$4.00',
                ),
                CoffeeTile(
                    coffeImagePath: 'assets/coffeone.jpg',
                    coffeeName: 'Cappuccino',
                    coffeePrice: '\$6.00'),
                CoffeeTile(
                    coffeImagePath: 'assets/coffethree.jpg',
                    coffeeName: 'Milk Coffee',
                    coffeePrice: '\$8.00')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
