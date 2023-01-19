import 'package:flutter/material.dart';
import 'package:flutter_authentication/authentication.dart';
import 'package:flutter_authentication/user_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/userDetails": (context) => UserDetails(),
      },
      home: UserDetails(),
    );
  }
}
