import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color coffeeBrown = Color(0xFF6F4E37);
const Color darkRoast = Color(0xFF3E2723);

class MenuItem {
  const MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.icon,
  });

  final String name;
  final String description;
  final String price;
  final String image;
  final IconData icon;
}

const List<MenuItem> hotCoffee = [
  MenuItem(
    name: 'Espresso',
    description: 'Bold, rich single shot',
    price: 'RM 6.50',
    image: 'assets/images/espresso.jpg',
    icon: Icons.coffee,
  ),
  MenuItem(
    name: 'Latte',
    description: 'Espresso with silky steamed milk',
    price: 'RM 9.00',
    image: 'assets/images/latte.jpg',
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Cappuccino',
    description: 'Espresso, steamed milk and thick foam',
    price: 'RM 9.00',
    image: 'assets/images/cappuccino.jpg',
    icon: Icons.local_cafe,
  ),
  MenuItem(
    name: 'Mocha',
    description: 'Espresso, chocolate and steamed milk',
    price: 'RM 10.50',
    image: 'assets/images/mocha.jpg',
    icon: Icons.coffee,
  ),
];

const List<MenuItem> coldAndPastries = [
  MenuItem(
    name: 'Iced Latte',
    description: 'Chilled espresso over milk and ice',
    price: 'RM 10.00',
    image: 'assets/images/iced_latte.jpg',
    icon: Icons.ac_unit,
  ),
  MenuItem(
    name: 'Butter Croissant',
    description: 'Flaky, buttery and baked fresh daily',
    price: 'RM 7.50',
    image: 'assets/images/croissant.jpg',
    icon: Icons.bakery_dining,
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brew & Bean Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: coffeeBrown),
        scaffoldBackgroundColor: const Color(0xFFF5EFE6),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: coffeeBrown,
        foregroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(Icons.coffee),
            SizedBox(width: 8),
            Text('Brew & Bean Cafe'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const MenuHeader(),
          const SizedBox(height: 24),
          const SectionTitle(
            title: 'Hot Coffee',
            icon: Icons.local_fire_department,
          ),
          for (final item in hotCoffee) MenuCard(item: item),
          const SizedBox(height: 16),
          const SectionTitle(
            title: 'Cold Drinks & Pastries',
            icon: Icons.ac_unit,
          ),
          for (final item in coldAndPastries) MenuCard(item: item),
        ],
      ),
    );
  }
}

class MenuHeader extends StatelessWidget {
  const MenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [coffeeBrown, Color(0xFFA67B5B)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.local_cafe, color: Colors.white, size: 48),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Freshly brewed, every day',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: coffeeBrown),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: darkRoast,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(item.icon, size: 18, color: coffeeBrown),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkRoast,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: coffeeBrown,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item.price,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
