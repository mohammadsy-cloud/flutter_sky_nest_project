import 'package:demo_project/common/theme/color_pallete.dart';
import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomHotelCard extends StatelessWidget {
  const CustomHotelCard({
    super.key,
    required this.hotelName,
    required this.imagePath,
    required this.rating,
    required this.price,
  });
  final String hotelName;
  final String imagePath;
  final double rating;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(32, 0, 0, 0),
            offset: Offset(0.0, 0.0),
            blurRadius: 5,
            spreadRadius: 0.5,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(15),

      width: screenWidth(context),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight(context) * 0.17,
            width: screenWidth(context),
            decoration: BoxDecoration(
              color: ColorPallete.grayColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RatingBar(
                itemSize: 20,
                updateOnDrag: false,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.amber),
                  half: Icon(Icons.star_half_outlined, color: Colors.amber),
                  empty: Icon(Icons.star_border, color: Colors.amber),
                ),
                glowColor: Colors.amber,
                initialRating: rating,

                onRatingUpdate: (value) {},
              ),
              Text('4.5'),
            ],
          ),

          Text(
            hotelName,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [Icon(Icons.location_on_sharp), Text('Damascus,Syria')],
          ),
          Text(
            '\$$price/night',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
