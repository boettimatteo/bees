import 'package:bees/pages/homepage.dart';
import 'package:bees/pages/login_page.dart';
import 'package:flutter/material.dart';

class BeesApp extends StatefulWidget {
  const BeesApp({super.key});

  @override
  State<BeesApp> createState() => _BeesAppState();
}

class _BeesAppState extends State<BeesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bees App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        "homepage": (context) => const Homepage(),
      },
    );
  }
}
