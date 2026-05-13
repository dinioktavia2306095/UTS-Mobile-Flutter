import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Mobile Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE221F3),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE221F3),
        ),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
  
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),

        
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/home') {
          final username = settings.arguments as String? ?? 'Pengguna';
          return MaterialPageRoute(
            builder: (_) => HomePage(username: username),
          );
        }
        return null;
      },
    );
  }
}
