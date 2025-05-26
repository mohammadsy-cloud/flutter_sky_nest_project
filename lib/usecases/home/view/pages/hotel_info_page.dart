import 'package:demo_project/common/theme/color_pallete.dart';
import 'package:demo_project/common/utilities/app_utilities.dart';
import 'package:demo_project/common/widgets/counter_widget.dart';
import 'package:demo_project/common/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class HotelInfoPage extends StatelessWidget {
  HotelInfoPage({super.key, required this.hotelName});
  final String hotelName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            stretch: true,
            expandedHeight: screenHeight(context) * 0.3,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'assets/images/hotel_image3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar(
                        itemSize: 25,
                        updateOnDrag: false,
                        ratingWidget: RatingWidget(
                          full: Icon(Icons.star, color: Colors.amber),
                          half: Icon(
                            Icons.star_half_outlined,
                            color: Colors.amber,
                          ),
                          empty: Icon(Icons.star_border, color: Colors.amber),
                        ),
                        glowColor: Colors.amber,
                        initialRating: (4.5),

                        onRatingUpdate: (value) {},
                      ),
                      Text('4.5'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    hotelName,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.location_on_sharp),
                      Text('Damascus,Syria'),
                    ],
                  ),
                  CustomDivider(spacing: 10),
                  Text(
                    'Overview',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                    ' sed do eiusmod tempor incididunt ut labore et dolore magna'
                    ' aliqua. Ut enim ad minim veniam, quis nostrud exercitation .',
                    style: TextStyle(fontSize: 12),
                  ),
                  CustomDivider(spacing: 10),
                  SizedBox(
                    width: screenWidth(context),
                    height: screenHeight(context) * 0.21,
                    child: Column(
                      spacing: 20,
                      children: [
                        Row(
                          children: [
                            Text('Photos', style: TextStyle(fontSize: 23)),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: 4,
                            itemExtent: screenWidth(context) * 0.5,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                ),
                                child: Container(
                                  height: screenHeight(context) * 0.05,
                                  decoration: BoxDecoration(
                                    color: ColorPallete.grayColor,
                                    borderRadius: BorderRadius.circular(11),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        index % 2 == 0
                                            ? 'assets/images/hotel_image4.jpg'
                                            : 'assets/images/hotel_image6.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomDivider(spacing: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: '\$120',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: '/night',
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidth(context) * 0.4,
                        height: screenHeight(context) * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return _buildModalOverlayContent(context);
                              },
                            );
                          },
                          child: Text('Select Date'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildModalOverlayContent(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context) * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Container(
            width: 80,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: screenHeight(context) * 0.4,
            width: screenWidth(context) * 0.9,
            child: CustomDateTable(
              onSelectDate: (selectedDate) {
                _selectedDay = selectedDate;
              },
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: screenWidth(context) * 0.65,
            height: screenHeight(context) * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(context).pop();
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return _buildRoomsOverlay(context);
                  },
                );
              },
              child: Text('Select rooms'),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildRoomsOverlay(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context) * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              width: 80,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Select the number of rooms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Rooms', style: TextStyle(fontSize: 18)),
                CounterWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DateTime _selectedDay = DateTime.now();
}

class CustomDateTable extends StatefulWidget {
  const CustomDateTable({super.key, required this.onSelectDate});
  final void Function(DateTime selectedDate) onSelectDate;

  @override
  State<CustomDateTable> createState() => _CustomDateTableState();
}

class _CustomDateTableState extends State<CustomDateTable> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
          widget.onSelectDate(selectedDay);
        });
      },
      rowHeight: 50,
      firstDay: DateTime.now(),
      focusedDay: _focusedDay,
      lastDay: DateTime(2027),
    );
  }

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
}
