import 'package:demo_project/common/theme/color_pallete.dart';
import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BrowseHotelsPage extends StatelessWidget {
  const BrowseHotelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight(context) * 0.1,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: screenWidth(context) * 0.85,
                height: screenHeight(context) * 0.08,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorPallete.grayColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back_ios, size: 35),
                    ),
                    SizedBox(
                      width: screenWidth(context) * 0.6,
                      child: TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO clear the textfield
                      },
                      child: Icon(Icons.cancel, size: 35),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemExtent: screenHeight(context) * 0.19,
                itemCount: 10,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: screenWidth(context),
                      height: screenHeight(context) * 0.18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.outer,
                            color: Colors.black,
                            spreadRadius: 0.2,
                            offset: Offset(0.0, 4.5),
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: screenWidth(context) * 0.28,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                alignment: Alignment(-0.5, 0.0),
                                image: AssetImage(
                                  index % 2 == 0
                                      ? 'assets/images/hotel_photo4.jpg'
                                      : 'assets/images/hotel_image1.jpeg',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RatingBar(
                                    itemSize: 20,
                                    updateOnDrag: false,
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      half: Icon(
                                        Icons.star_half_outlined,
                                        color: Colors.amber,
                                      ),
                                      empty: Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    glowColor: Colors.amber,
                                    initialRating: (5 - index % 5),

                                    onRatingUpdate: (value) {},
                                  ),
                                ],
                              ),
                              Text(
                                'Paradise Mint $index',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_sharp),
                                  Text('Damascus,Syria'),
                                ],
                              ),
                              Text(
                                '\$${index % 2 + index + 1}00/night',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
