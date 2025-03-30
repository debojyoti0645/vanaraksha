import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanaraksha/providers/user_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).loadStoredUserData();
  }

  void _handleGetStarted(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    if (userProvider.isLoggedIn()) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the current theme's colors
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // Use theme background color
      backgroundColor: colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 400),
              child: Image.asset(
                'lib/assets/images/splash.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'WELCOME',
              style: TextStyle(
                fontSize: 16,
                // Use secondary text color from theme
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Let's start conserving",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                // Use primary text color from theme
                color: colorScheme.onSurface,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "with ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  "VanaRaksha",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () => _handleGetStarted(context),
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  // Use primary color from theme
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: colorScheme.primary, width: 2),
                ),
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // Use onPrimary color for text on primary background
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
