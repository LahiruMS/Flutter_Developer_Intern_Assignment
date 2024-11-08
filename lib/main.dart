import 'package:flutter/material.dart';
import 'package:flutter_developer_intern_assignment/screens/all_products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllProducts(),
    );
  }
}
