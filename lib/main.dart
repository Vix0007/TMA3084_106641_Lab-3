import 'package:flutter/material.dart';

// starts the app
void main() {
  runApp(const MyApp());
}

// the main app, just opens the menu page
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // hides the red debug banner
      home: MenuPage(),
    );
  }
}

// the menu screen with the 3 cards
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant Menu')),

      // column so the 3 cards stack on top of each other
      body: Column(
        children: [
          // card 1: chicken
          foodCard(context, '🍗', 'Chicken Chop Alfresco', 'RM 14.00',
              'Crispy chicken chop from Alfresco.'),

          // card 2: lamb
          foodCard(context, '🍖', 'Lamb Chop', 'RM 22.00',
              'Grilled lamb chop served with sides.'),

          // card 3: fish
          foodCard(context, '🐟', 'Fish and Chips', 'RM 15.00',
              'Crispy fried fish fillet with fries.'),
        ],
      ),
    );
  }

  // makes one card so we dont repeat the same code 3 times
  Widget foodCard(BuildContext context, String emoji, String name,
      String price, String info) {
    return Card(
      child: ListTile(
        leading: Text(emoji, style: const TextStyle(fontSize: 32)),
        title: Text(name),
        subtitle: Text(price),

        // extra task: tap the card to open the details page
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(emoji, name, price, info),
            ),
          );
        },
      ),
    );
  }
}

// the second screen that shows info about the food you tapped
class DetailPage extends StatelessWidget {
  final String emoji;
  final String name;
  final String price;
  final String info;

  const DetailPage(this.emoji, this.name, this.price, this.info, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // keeps everything in the middle
          children: [
            Text(emoji, style: const TextStyle(fontSize: 100)),
            Text(price, style: const TextStyle(fontSize: 24)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(info, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}