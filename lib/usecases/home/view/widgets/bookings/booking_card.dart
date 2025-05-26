import 'package:demo_project/common/theme/color_pallete.dart';
import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, this.isBooking = false});
  final bool isBooking;

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isBooking)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking ID : 098876543',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'lorem ipsum dolor sit amet something',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 5),
              ],
            ),

          Row(
            children: [
              Container(
                width: screenWidth(context) * 0.2,
                height: screenHeight(context) * 0.1,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/hotel_image1.jpeg'),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth(context) * 0.2,
                        height: screenHeight(context) * 0.03,
                        child: FittedBox(
                          child: RatingBar(
                            glow: false,
                            ignoreGestures: true,
                            ratingWidget: RatingWidget(
                              full: Icon(Icons.star, color: Colors.amber),
                              half: Icon(Icons.star_half, color: Colors.amber),
                              empty: Icon(
                                Icons.star_outline,
                                color: Colors.amber,
                              ),
                            ),
                            onRatingUpdate: (rate) {},
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text('4.5', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Text(
                    'Malon Greens',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, size: 15),
                      Text('Damascus,Syria', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          if (isBooking)
            Column(
              children: [
                SizedBox(height: 15),
                SizedBox(
                  width: screenWidth(context),
                  child: Row(
                    spacing: 10,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {}, //! or null
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.grayColor2,
                            disabledBackgroundColor: Colors.red,
                            foregroundColor: Colors.black,
                            disabledForegroundColor: Colors.white,
                          ),
                          child: Text('Cancel'),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          child: Text('View Details'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
