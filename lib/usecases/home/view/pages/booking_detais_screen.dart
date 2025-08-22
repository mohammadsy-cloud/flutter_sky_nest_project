import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/utilities/enumirations.dart';
import '../../model/reservation.dart';

class BookingDetaisScreen extends StatefulWidget {
  const BookingDetaisScreen({super.key, required this.booking});
  final Reservation booking;

  @override
  State<BookingDetaisScreen> createState() => _BookingDetaisScreenState();
}

class _BookingDetaisScreenState extends State<BookingDetaisScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: Text(
          widget.booking.hotelName ?? 'No name',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        toolbarHeight: screenHeight(context) * 0.08,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: 40,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth(context),
              // height: screenHeight(context) * 0.2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start date:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.MMMEd().format(
                          widget.booking.bookingStartDate ?? DateTime.now(),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'End date:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.MMMEd().format(
                          widget.booking.bookingEndDate ?? DateTime.now(),
                        ),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Number of nights:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        (widget.booking.numberOfNights ?? 0).toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total cost:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        (widget.booking.totalCost ?? 0.0).toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Booking status:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        (widget.booking.statusBooking ??
                                BookingStatus.activated)
                            .name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if ((widget.booking.statusBooking ?? BookingStatus.canceled)
                .isActivated)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    screenWidth(context),
                    screenHeight(context) * 0.07,
                  ),
                ),
                onPressed: () {},
                child: Text('Cancel'),
              ),
          ],
        ),
      ),
    );
  }
}
