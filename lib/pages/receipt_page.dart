import 'package:flutter/cupertino.dart';

class ReceiptPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const ReceiptPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Calculate total price of the items in the cart
    double total = cartItems.fold(0, (sum, item) {
      return sum + (item['price'] * item['quantity']);
    });

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Receipt'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Receipt',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item['name']),
                          Text('₱${item['price']} x ${item['quantity']}'),
                          Text('₱${item['price'] * item['quantity']}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Custom Divider
              Container(
                height: 1,
                color: CupertinoColors.systemGrey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('₱$total', style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text('Done', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
