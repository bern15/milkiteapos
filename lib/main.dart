import 'package:flutter/cupertino.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MilkTeaPOSApp());
}

class MilkTeaPOSApp extends StatelessWidget {
  const MilkTeaPOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
