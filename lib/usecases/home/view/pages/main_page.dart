import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/usecases/home/view/widgets/bookings/booking_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../common/theme/color_pallete.dart';
import '../widgets/home/home_screen_widget.dart';
import '../widgets/select_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _Maintate();
}

class _Maintate extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _currentIndex == 0
              ? null
              : AppBar(
                forceMaterialTransparency: true,
                title: Text('Bookings'),
                toolbarHeight: screenHeight(context) * 0.1,
              ),
      body:
          _currentIndex == 0
              ? HomeScreenWidget()
              : _currentIndex == 1
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SelectWidget(
                        titles: ['Upcoming', 'Canceled', 'Rejected'],
                        onSelected: (index) {},
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        shrinkWrap: true,
                        itemExtent: screenHeight(context) * 0.28,
                        itemCount: 10,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: BookingCard(isBooking: true),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
              : Placeholder(),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        activeColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        style: TabStyle.textIn,
        items: [
          TabItem(icon: Icon(Icons.home), title: 'Home'),
          TabItem(icon: Icon(Icons.book), title: 'Reservations'),
          TabItem(icon: Icon(Icons.flight), title: 'Flights'),
          TabItem(icon: Icon(Icons.person), title: 'Profile'),
        ],
      ),
    );
  }
}
