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
    Widget titleSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xffffffff),
                  ),
                ),
                Text(
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
          const Text('41'),
        ],
      ),
    );

    Widget buttonSection = Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xc4ffffff),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 8),
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          SizedBox(width: 8),
          _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
          SizedBox(width: 8),
          _buildButtonColumn(Colors.black, Icons.share, 'SHARE'),
          SizedBox(width: 8),
        ],
      ),
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
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
              width: 600,
              height: 400,
              fit: BoxFit.cover,
            ),
            buttonSection,
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Color(0x5f000000), // Колір фону
                      borderRadius:
                          BorderRadius.circular(20.0), // Закруглені кути
                    ),
                    child: Column(
                      children: [
                        titleSection,
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
          margin: const EdgeInsets.only(top: 16),
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
