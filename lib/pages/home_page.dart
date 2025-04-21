import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic> item, int quantity) onAddToCart;

  const HomePage({
    super.key,
    required this.cartItems,
    required this.onAddToCart,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, int> itemQuantities = {};

  final List<Map<String, dynamic>> menuItems = [
    ...List.generate(10, (index) => {
      'category': 'Milk Tea',
      'name': [
        'Classic Milk Tea', 'Wintermelon', 'Hokkaido Milk Tea', 'Okinawa Milk Tea',
        'Taro Milk Tea', 'Matcha Milk Tea', 'Chocolate Milk Tea', 'Caramel Milk Tea',
        'Thai Milk Tea', 'Brown Sugar'
      ][index],
      'image': 'assets/images/milktea${index + 1}.png',
      'price': 90,
    }),
    ...List.generate(10, (index) => {
      'category': 'Coffee',
      'name': [
        'Espresso', 'Americano', 'Latte', 'Cappuccino', 'Mocha', 'Macchiato',
        'Flat White', 'Iced Coffee', 'Cold Brew', 'Irish Coffee'
      ][index],
      'image': 'assets/images/coffee${index + 1}.png',
      'price': 100,
    }),
    ...List.generate(10, (index) => {
      'category': 'Bread',
      'name': [
        'Croissant', 'Baguette', 'Garlic Bread', 'Cheese Bread', 'Milk Bread',
        'Banana Bread', 'Focaccia', 'Ciabatta', 'Pandesal', 'Ensaymada'
      ][index],
      'image': 'assets/images/bread${index + 1}.png',
      'price': 50,
    }),
  ];

  void addToCart(Map<String, dynamic> item) {
    final qty = itemQuantities[item['name']] ?? 0;
    if (qty > 0) {
      widget.onAddToCart(item, qty);
      setState(() {
        itemQuantities[item['name']] = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('MilkiTea POS', style: TextStyle(color: CupertinoColors.white)),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 220,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    final qty = itemQuantities[item['name']] ?? 0;

                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Image.asset(item['image'], height: 80, fit: BoxFit.cover),
                          const SizedBox(height: 6),
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.black,
                            ),
                          ),
                          Text(
                            '${item['category']} - ₱${item['price']}',
                            style: const TextStyle(
                              color: CupertinoColors.black,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Icon(CupertinoIcons.minus_circle),
                                onPressed: () {
                                  setState(() {
                                    if (qty > 0) itemQuantities[item['name']] = qty - 1;
                                  });
                                },
                              ),
                              Text(
                                '$qty',
                                style: const TextStyle(
                                  color: CupertinoColors.black,
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                child: const Icon(CupertinoIcons.plus_circle),
                                onPressed: () {
                                  setState(() {
                                    itemQuantities[item['name']] = qty + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                CupertinoButton.filled(
                  child: const Text('Add to Cart'),
                  onPressed: () {
                    for (var item in menuItems) {
                      final qty = itemQuantities[item['name']] ?? 0;
                      if (qty > 0) addToCart(item);
                    }
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
