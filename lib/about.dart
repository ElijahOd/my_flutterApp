import 'package:flutter/material.dart';
import 'package:myflutterapp/main.dart';

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
  late TextEditingController controllerTitle;
  late TextEditingController controllerDescription;
  late CardInfo cardInfoNew;

  @override
  void initState() {
    cardInfoNew = CardInfo(
      title: widget.cardInfo.title,
      description: widget.cardInfo.description,
      star: widget.cardInfo.star,
      id: widget.cardInfo.id,
      imageUrl: widget.cardInfo.imageUrl,
    );
    controllerTitle = TextEditingController(text: cardInfoNew.title);
    controllerDescription =
        TextEditingController(text: cardInfoNew.description);

    super.initState();
  }

  void save() {
    cardInfoNew.title = controllerTitle.text;
    cardInfoNew.description = controllerDescription.text;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool confirmExit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Warning'),
            content:
                const Text('Are you sure you want to leave without saving?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Color(0xffff0000)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
            ],
          ),
        );
        return confirmExit == true;
      },
      child: Scaffold(
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
                    TextField(controller: controllerTitle),
                    const SizedBox(height: 32),
                    TextField(controller: controllerDescription),
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
      ),
    );
  }
}
