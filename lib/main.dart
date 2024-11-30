import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MobileCenterApp(),
  ));
}

class MobileCenterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobile Center"),
        titleTextStyle: TextStyle(
          color: const Color.fromARGB(255, 248, 248, 248),
          fontSize: 30,
        ),
        backgroundColor: const Color.fromARGB(255, 53, 132, 250),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: const Color.fromRGBO(7, 175, 187, 1)),
              child: Text(
                "Menu",
                style: TextStyle(
                    color: const Color.fromARGB(255, 252, 252, 252),
                    fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("Favorites"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Products(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

Widget Products() {
  var products = [
    {"name": "Iphone 14 ProMax", "price": "\$1000", "icon": Icons.phone_iphone},
    {"name": "MacBook Pro", "price": "\$2000", "icon": Icons.laptop},
    {"name": "AirPods Max", "price": "\$500", "icon": Icons.headset},
    {"name": "Apple Watch", "price": "\$520", "icon": Icons.watch},
  ];

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product List",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: products.map((product) {
                  return buildProductCard(context, product);
                }).toList(),
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget buildProductCard(BuildContext context, Map<String, dynamic> product) {
  String productName = product['name'] as String;
  String productPrice = product['price'] as String;
  IconData productIcon = product['icon'] as IconData;
  Color icons = const Color.fromRGBO(7, 175, 187, 1);
  Color btncolor = const Color.fromARGB(255, 53, 132, 250);
  double cardWidth = (MediaQuery.of(context).size.width - 48) / 2;

  return Container(
    width: cardWidth,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 238, 237, 237), blurRadius: 3),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(productIcon, size: 40, color: icons),
        SizedBox(height: 8),
        Text(
          productName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          productPrice,
          style: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: btncolor,
              foregroundColor: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {},
          child: Text("Buy Now"),
        ),
      ],
    ),
  );
}
