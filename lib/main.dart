// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:myflutterapp/card.dart';
import 'package:myflutterapp/about.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<CardInfo> _listOfCard = [];

  @override
  void initState() {
    generateCardInfo();

    super.initState();
  }

  void generateCardInfo() {
    for (int i = 0; i < 10; i++) {
      _listOfCard.add(CardInfo(
        title: 'Title ${i + 1}',
        id: i,
      ));
    }
  }

  void updateCard(CardInfo newCardInfo) {
    setState(() {
      _listOfCard[newCardInfo.id] = newCardInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app',
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter app's by OD")),
        body: ListView.builder(
          itemCount: _listOfCard.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCard(
                cardInfo: _listOfCard[index],
                onTap: () async {
                  final newCardInfo = await Navigator.push<CardInfo>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AboutPage(
                        cardInfo: _listOfCard[index],
                      ),
                    ),
                  );
                  if (newCardInfo != null) {
                    updateCard(newCardInfo);
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardInfo {
  String title;
  final int id;
  final String imageUrl;

  CardInfo({
    required this.title,
    required this.id,
    this.imageUrl =
        'https://raw.githubusercontent.com/flutter/website/main/examples/layout/lakes/step5/images/lake.jpg',
  });
}
