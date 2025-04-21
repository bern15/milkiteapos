import 'package:flutter/cupertino.dart';

class DevAboutPage extends StatelessWidget {
  const DevAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('About Developers'),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Milk Tea POS System',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text('Developed by:',
                    style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text('• Bernard Soria\n• Ronnel Deang\n• Adrian Canlas\n• Jairo Penaflor',
                    style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
