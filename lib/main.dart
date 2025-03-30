import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vanaraksha/screens/carbon_footprint_screen.dart';
import 'package:vanaraksha/screens/home_screen.dart';
import 'package:vanaraksha/screens/login_screen.dart';
import 'package:vanaraksha/screens/profile_screen.dart';
import 'package:vanaraksha/screens/register_screen.dart';
import 'package:vanaraksha/screens/settings_page.dart';
import 'package:vanaraksha/screens/splash_screen.dart';
import 'package:vanaraksha/providers/auth_provider.dart';
import 'package:vanaraksha/providers/user_provider.dart';
import 'package:vanaraksha/theme_provider.dart';
import 'package:vanaraksha/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Forest Conservation',
          darkTheme: AppThemes.darkTheme,
          theme: AppThemes.lightTheme,
          themeMode: Provider.of<ThemeProvider>(context).themeMode,
          home: authProvider.isAuthenticated ? HomeScreen() : SplashScreen(),
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/home': (context) => HomeScreen(),
            '/profile': (context) => ProfileScreen(),
            '/settings': (context) => const SettingsPage(),
            '/carbon-footprint': (context) => CarbonFootprintScreen(),
          },
          navigatorKey: GlobalKey<NavigatorState>(),
        );
      },
    );
  }
}