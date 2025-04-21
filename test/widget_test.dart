import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:milkiteapos/main.dart'; // Update if your project folder or app name is different

void main() {
  testWidgets('Login page loads and shows login button', (WidgetTester tester) async {
    // Build your app and trigger a frame
    await tester.pumpWidget(const MilkTeaPOSApp());

    // Verify the presence of the login button
    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(CupertinoTextField), findsNWidgets(2)); // Username and Password fields
  });
}
