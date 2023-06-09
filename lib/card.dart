import 'package:flutter/material.dart';
import 'package:myflutterapp/main.dart';

class CustomCard extends StatelessWidget {
  final CardInfo cardInfo;
  final VoidCallback onTap;

  const CustomCard({
    Key? key,
    required this.cardInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Tooltip(
            message: 'Edit title',
            child: SizedBox(
              width: 200,
              height: 22,
              child: Text(
                cardInfo.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFDFDFD),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          icon: Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          onPressed: () {
            cardInfo.star += 1;
            (context as Element).markNeedsBuild();
          },
        ),
        Text(
          '${cardInfo.star}',
          style: const TextStyle(color: Color(0xffFDFDFD)),
        ),
      ],
    );

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

    Widget buttonSection = Container(
      color: const Color(0xa1ffffff), // Білий колір фону
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          _buildButtonColumn(const Color(0xff4B96F3), Icons.call, 'CALL'),
          const SizedBox(width: 8),
          _buildButtonColumn(const Color(0xff4CAF51), Icons.near_me, 'ROUTE'),
          const SizedBox(width: 8),
          _buildButtonColumn(const Color(0xff000000), Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = GestureDetector(
      onTap: onTap,
      child: Tooltip(
        message: 'Edit description',
        child: Text(
          cardInfo.description,
          softWrap: true,
          style: const TextStyle(
            color: Color(0xffFDFDFD),
          ),
        ),
      ),
    );

    return Stack(
      children: [
        Image.network(
          cardInfo.imageUrl,
          width: double.infinity,
          //height: 230,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 16,
          left: 16,
          child: Container(
            width: 64.0, // Ширина фону
            height: 64.0, // Закруглені кути
            decoration: BoxDecoration(
                color: const Color(0xcd000000), // Колір фону
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                '#${cardInfo.id + 1}.',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFDFDFD),
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: (buttonSection),
        ),
        Positioned(
          top: 140,
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
                  borderRadius: BorderRadius.circular(20.0), // Закруглені кути
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
    );
  }
}
