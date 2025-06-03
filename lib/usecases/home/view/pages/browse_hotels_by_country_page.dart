import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/usecases/home/view/widgets/custom_hotel_card.dart';
import 'package:flutter/material.dart';

class BrowseHotelsByCountryPage extends StatelessWidget {
  const BrowseHotelsByCountryPage({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text(countryName),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 23,
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemExtent: screenHeight(context) * 0.39,
        itemCount: 10,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CustomHotelCard(
              hotelName: 'Paradise Mint $index',
              imagePath:
                  index % 2 == 0
                      ? 'assets/images/hotel_image3.jpg'
                      : 'assets/images/hotel_image1.jpeg',
              rating: (5 - index % 5),
              price: index % 2 + index + 1,
            ),
          );
        },
      ),
    );
  }

  final String countryName;
}
