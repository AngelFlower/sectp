import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

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
    Provider.of<Auth>(context, listen: false).attempt(key!);
  }

  @override
  void initState() {
    _attemptAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.00,
                color: Colors.grey.shade800),
            headline3: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.00,
                color: Colors.white),
            subtitle1: const TextStyle(color: Colors.white),
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
        });
  }
}
