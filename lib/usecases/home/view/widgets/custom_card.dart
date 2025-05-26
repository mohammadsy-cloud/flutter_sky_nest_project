import 'package:demo_project/common/theme/color_pallete.dart';
import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title1,
    required this.title2,
    required this.title3,
  });
  final String imagePath;
  final String title1;
  final String title2;
  final String title3;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            ColorPallete.grayColor1,
            ColorPallete.grayColor1.withAlpha(200),
          ],
        ),
        color: ColorPallete.grayColor1,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            fit: BoxFit.cover,
            imagePath,
            height: screenHeight(context) * 0.13,
            width: screenWidth(context),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title2,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title3,
              style: TextStyle(fontSize: 15, color: Colors.green[400]),
            ),
          ),
        ],
      ),
    );
  }
}
