import 'package:flutter/cupertino.dart';
import 'receipt_page.dart'; // Make sure to import the receipt_page.dart

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final VoidCallback onClearCart;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onClearCart,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Cart'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onClearCart,
          child: const Icon(CupertinoIcons.delete),
        ),
      ),
      child: SafeArea(
        child: cartItems.isEmpty
            ? const Center(child: Text('Your cart is empty'))
            : Column(
          children: [
            // Cart items list view
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name'], style: const TextStyle(fontSize: 18)),
                        Text('Qty: ${item['quantity']}  - ₱${item['price']} each'),
                        const SizedBox(height: 8),
                        // Divider
                        Container(
                          height: 1,
                          color: CupertinoColors.systemGrey,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Buy Button
            CupertinoButton.filled(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('Buy Now', style: TextStyle(fontSize: 16)),
              onPressed: () {
                // Navigate to ReceiptPage and pass the cartItems
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => ReceiptPage(cartItems: cartItems),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
