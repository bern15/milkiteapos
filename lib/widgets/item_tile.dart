import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class ItemTile extends StatefulWidget {
  final String itemName;
  final double itemPrice;
  final String itemImage;
  final Function(CartItem item) onAddToCart;

  const ItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.onAddToCart,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  int _quantity = 0;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _addToCart() {
    if (_quantity > 0) {
      final cartItem = CartItem(
        name: widget.itemName,
        price: widget.itemPrice,
        quantity: _quantity,
      );
      widget.onAddToCart(cartItem);
      setState(() {
        _quantity = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              widget.itemImage,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          // Item Name and Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text('₱${widget.itemPrice.toStringAsFixed(2)}'),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Quantity Controls
          Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: _decrementQuantity,
                child: const Icon(CupertinoIcons.minus, size: 18),
              ),
              Text('$_quantity'),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: _incrementQuantity,
                child: const Icon(CupertinoIcons.plus, size: 18),
              ),
            ],
          ),
          const SizedBox(width: 12),
          // Add Button
          CupertinoButton.filled(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onPressed: _addToCart,
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
