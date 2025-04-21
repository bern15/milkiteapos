import 'package:flutter/cupertino.dart';
import 'app_scaffold.dart'; // Make sure to import AppScaffold
import 'package:flutter/services.dart'; // To manage the system UI

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _obscurePassword = true;

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username == 'employee' && password == '1234') {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (context) => const AppScaffold()), // Instantiate AppScaffold without parameters
      );
    } else {
      setState(() {
        _errorText = 'Invalid username or password';
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Employee Login'),
      ),
      child: SafeArea(
        child: SingleChildScrollView( // Add SingleChildScrollView here
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image at the top of the page (you can replace this with your actual asset)
                Image.asset(
                  'assets/images/your_thumbnail.png', // replace with your image asset
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 30),

                // Username field with icon
                CupertinoTextField(
                  controller: _usernameController,
                  placeholder: 'Username',
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(CupertinoIcons.person, color: CupertinoColors.inactiveGray),
                  ),
                ),
                const SizedBox(height: 12),

                // Password field with icon and eye icon to toggle visibility
                CupertinoTextField(
                  controller: _passwordController,
                  placeholder: 'Password',
                  obscureText: _obscurePassword,
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(CupertinoIcons.lock, color: CupertinoColors.inactiveGray),
                  ),
                  suffix: GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        _obscurePassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Error message if login fails
                if (_errorText.isNotEmpty)
                  Text(_errorText, style: const TextStyle(color: CupertinoColors.systemRed)),

                const SizedBox(height: 10),

                // Login button
                CupertinoButton.filled(
                  child: const Text('Login'),
                  onPressed: _login,
                ),

                const SizedBox(height: 20),

                // Forgot Password button
                CupertinoButton(
                  child: const Text('Forgot Password?'),
                  onPressed: () {
                    // Show an alert when forgot password is pressed
                    showCupertinoDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text('Username and Password'),
                          content: const Text('Username: employee\nPassword: 1234'),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}