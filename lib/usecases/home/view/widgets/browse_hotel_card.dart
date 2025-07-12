import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';

class BrowseHotelCard extends StatelessWidget {
  const BrowseHotelCard({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth(context),
        height: screenHeight(context) * 0.19,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              // color: Colors.black,
              spreadRadius: 0.2,
              offset: Offset(0.0, 1.0),
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
                  image: AssetImage('assets/images/hotel_image1.jpeg'),
                ),
              ),
              child:
                  (hotel.imageDTOList ?? []).isEmpty
                      ? Center()
                      : CustomNetworkImage(
                        imagePath: (hotel.imageDTOList?.first.imageUrl ?? ''),
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
                      ignoreGestures: true,
                      ratingWidget: RatingWidget(
                        full: Icon(Icons.star, color: Colors.amber),
                        half: Icon(
                          Icons.star_half_outlined,
                          color: Colors.amber,
                        ),
                        empty: Icon(Icons.star_border, color: Colors.amber),
                      ),
                      glowColor: Colors.amber,
                      initialRating: hotel.avgRating ?? 0.0,

                      onRatingUpdate: (value) {},
                    ),
                  ],
                ),
                Text(
                  hotel.name ?? 'No name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_sharp),
                    Text(hotel.address ?? 'No address'),
                  ],
                ),
                Text(
                  '\$100/night',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
