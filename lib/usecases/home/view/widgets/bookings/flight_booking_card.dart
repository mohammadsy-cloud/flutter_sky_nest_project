import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/usecases/home/model/flight.dart';
import 'package:sky_nest/usecases/home/model/reservation.dart';
import 'package:sky_nest/usecases/home/viewmodel/flight_reservations_bloc/flight_reservations_bloc.dart';

import '../../../../../common/navigation/routes.dart';
import '../../../../../common/utilities/enumirations.dart';
import '../../../viewmodel/hotel_reservations_bloc/hotel_reservations_bloc.dart';
import '../../../viewmodel/reservation_card_cubit/reservation_card_cubit.dart';

class FlightBookingCard extends StatefulWidget {
  const FlightBookingCard({
    super.key,
    this.isBooking = false,
    required this.reservation,
    this.isActivated = false,
  });
  final bool isBooking;
  final Flight reservation;
  final bool isActivated;

  @override
  State<FlightBookingCard> createState() => _FlightBookingCardState();
}

class _FlightBookingCardState extends State<FlightBookingCard> {
  @override
  void initState() {
    super.initState();
  }

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
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isBooking)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking ID : ${widget.reservation.id}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.reservation.tripType}',
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
                ),
                child: CustomNetworkImage(
                  imagePath: findFirstImageUrl(widget.reservation.flightImage),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    widget.reservation.airportName ?? 'No airport',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, size: 15),
                      Text(
                        'From ${widget.reservation.startingPoint ?? 'No start'}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, size: 15),
                      Text(
                        'To ${widget.reservation.destination ?? 'No end'}',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 15),
              SizedBox(
                width: screenWidth(context),
                child: Row(
                  spacing: 10,
                  children: [
                    if (widget.isBooking && widget.isActivated)
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: BlocConsumer<
                          FlightReservationsBloc,
                          FlightReservationsState
                        >(
                          listener: (context, state) {
                            if (state.status.isError) {
                              Fluttertoast.showToast(msg: state.message);
                            }
                            if (state.status.isDone) {
                              Fluttertoast.showToast(msg: state.message);

                              context.read<HotelReservationsBloc>().add(
                                ReservationsFetched(),
                              );
                            }
                          },
                          builder: (context, state) {
                            return state.status.isLoading
                                ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: FittedBox(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                                : ElevatedButton(
                                  onPressed: () {
                                    context.read<FlightReservationsBloc>().add(
                                      FlightReservationsEvent.cancelFlightBooking(
                                        widget.reservation.id ?? -1,
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorPallete.grayColor2,
                                    disabledBackgroundColor: Colors.red,
                                    foregroundColor: Colors.black,
                                    disabledForegroundColor: Colors.white,
                                  ),
                                  child: Text('Cancel'),
                                );
                          },
                        ),
                      ),
                    Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () {
                          _showReservationDialog(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
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

  Future<dynamic> _showReservationDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: SizedBox(
            width: screenWidth(context),
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
                        widget.reservation.startingPointDate ?? DateTime.now(),
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
                        widget.reservation.destinationDate ?? DateTime.now(),
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
                      'Number of chairs:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      (widget.reservation.numberOfChairs ?? 0).toString(),
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
                      (widget.reservation.basePrice ?? 0.0).toString(),
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
                      widget.reservation.status ?? '',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('close'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
