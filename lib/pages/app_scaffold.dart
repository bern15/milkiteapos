import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'dev_about.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  List<Map<String, dynamic>> _cartItems = [];

  void _addToCart(Map<String, dynamic> item, int quantity) {
    setState(() {
      final existingItemIndex = _cartItems.indexWhere((cartItem) => cartItem['name'] == item['name']);
      if (existingItemIndex != -1) {
        _cartItems[existingItemIndex]['quantity'] = (_cartItems[existingItemIndex]['quantity'] as int) + quantity;
      } else {
        _cartItems.add({...item, 'quantity': quantity});
      }
    });
  }

  void _clearCart() {
    setState(() {
      _cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'POS',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'About',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage(
                  cartItems: _cartItems,
                  onAddToCart: _addToCart,
                );
              case 1:
                return CartPage(
                  cartItems: _cartItems,
                  onClearCart: _clearCart,
                );
              case 2:
                return const DevAboutPage();
              default:
                return HomePage(
                  cartItems: _cartItems,
                  onAddToCart: _addToCart,
                );
            }
          },
        );
      },
    );
  }
}