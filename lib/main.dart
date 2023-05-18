import 'package:flutter/material.dart';
import 'package:myflutterapp/card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter app's by OD")),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(numbPage: index),
            );
          },
        ),
      ),
    );
  }
}
