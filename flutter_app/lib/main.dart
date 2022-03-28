import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'providers/auth.dart';
import 'package:provider/provider.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() =>
    runApp(ChangeNotifierProvider(create: (_) => Auth(), child: const MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = const FlutterSecureStorage();
  void _attemptAuthentication() async {
    final key = await storage.read(key: 'auth');
    if (key != null) {
      final auth = Provider.of<Auth>(context, listen: false);
      await auth.attempt(key);
    }
  }

  @override
  void initState() {
    _attemptAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SECTP',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          backgroundColor: Colors.grey.shade100,
          scaffoldBackgroundColor: Colors.grey.shade100,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.grey.shade100,
            foregroundColor: Colors.black,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.grey.shade100,

              // Status bar brightness (optional)
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 10.0,
              backgroundColor: Colors.grey.shade50,
              selectedItemColor: Colors.lightBlue,
              unselectedItemColor: Colors.grey),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27.00,
                color: Colors.grey.shade900),
            headline3: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.00,
                color: Colors.white),
            subtitle1:
                const TextStyle(fontWeight: FontWeight.w500, fontSize: 20.00),
            subtitle2: const TextStyle(
                color: Colors.white,
                fontSize: 14.00,
                fontWeight: FontWeight.w400),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Consumer<Auth>(
                builder: (context, auth, child) {
                  if (auth.isAuth) {
                    return const HomePage();
                  }
                  return const LoginPage();
                },
              ),
          'login': (context) => const LoginPage(),
          'home': (context) => const HomePage(),
          //'fish_tank_create': (context) => const FishTankCreate(),
          //'user_show': (context) => const UserShowPage(),
          //'user_edit': (context) => const UserEditPage(),
        });
  }
}
