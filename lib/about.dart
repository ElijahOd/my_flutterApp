// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:myflutterapp/main.dart';
import 'package:myflutterapp/card.dart';

class AboutPage extends StatefulWidget {
  final CardInfo cardInfo;

  const AboutPage({
    Key? key,
    required this.cardInfo,
  }) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late TextEditingController controller;
  late CardInfo cardInfoNew;

  @override
  void initState() {
    cardInfoNew = CardInfo(
      title: widget.cardInfo.title,
      id: widget.cardInfo.id,
      imageUrl: widget.cardInfo.imageUrl,
    );
    controller = TextEditingController(text: cardInfoNew.title);

    super.initState();
  }

  void save() {
    cardInfoNew.title = controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter app's by OD")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Image.network(
                    widget.cardInfo.imageUrl,
                    width: double.infinity,
                    //height: 230,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 32),
                  TextField(controller: controller),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  save();

                  Navigator.of(context).pop(cardInfoNew);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
