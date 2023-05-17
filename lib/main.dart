import 'package:flutter/material.dart';
// Uncomment lines 3 and 6 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              const Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffffffff),
                ),
              ),
              const Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Color(0xffcdcdcd),
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text(
          '41',
          style: TextStyle(color: Color(0xffcdcdcd)),
        ),
      ],
    );

    Widget buttonSection = Container(
      color: const Color(0xa1ffffff), // Білий колір фону
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          const SizedBox(width: 8),
          _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
          const SizedBox(width: 8),
          _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = const Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
      style: TextStyle(
        color: Color(0xffffffff),
      ),
    );

    Widget numbPage = Container(
      //padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xcd000000), // Колір фону
          borderRadius: BorderRadius.circular(50.0)),
      width: 64.0, // Ширина фону
      height: 64.0, // Закруглені кути
      child: const Text(
        '#1.',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
          fontSize: 22.0,
        ),
      ),
    );

    return MaterialApp(
      title: 'Flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter app's by OD"),
        ),
        body: Stack(
          //ListView
          children: [
            Image.network(
              'https://raw.githubusercontent.com/flutter/website/main/examples/layout/lakes/step5/images/lake.jpg',
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 16,
              left: 16,
              child: (numbPage),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: (buttonSection),
            ),
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    padding: const EdgeInsets.all(32.0),
                    decoration: BoxDecoration(
                      color: const Color(0xcd000000), // Колір фону
                      borderRadius:
                          BorderRadius.circular(20.0), // Закруглені кути
                    ),
                    child: Column(
                      children: [
                        titleSection,
                        const SizedBox(height: 32),
                        textSection,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
