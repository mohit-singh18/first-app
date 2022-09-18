import 'package:flutter/material.dart';
import 'package:secondapp/pages/home_page.dart';
import 'package:secondapp/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(
          brightness: Brightness.dark, primaryColor: Colors.deepPurple),
      initialRoute: "/",
      routes: {
        "/login": (context) => HomePage(),
        "/": (context) => LoginPage()
      },
    );
  }
}
