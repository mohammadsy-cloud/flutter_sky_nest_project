import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/usecases/home/model/flight.dart';

import '../../../../../common/utilities/app_utilities.dart';
import '../../../../../common/utilities/enumirations.dart';
import '../../../viewmodel/flight_reservations_bloc/flight_reservations_bloc.dart';
import '../empty_widget.dart';
import '../select_widget.dart';
import 'flight_booking_card.dart';

class FlightsBookingPage extends StatefulWidget {
  const FlightsBookingPage({super.key});

  @override
  State<FlightsBookingPage> createState() => _FlightsBookingPageState();
}

class _FlightsBookingPageState extends State<FlightsBookingPage> {
  @override
  void initState() {
    context.read<FlightReservationsBloc>()
      ..add(FlightReservationsEvent.changeFilter(BookingStatus.activated))
      ..add(FlightReservationsEvent.fetchFlightBookings());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: SelectWidget(
              selectedIndex: _currentIndex,
              titles:
                  BookingStatus.values.map((status) {
                    if (status.isUnacceptable) {
                      return 'Rejected';
                    }
                    return status.name[0].toUpperCase() +
                        status.name.substring(1);
                  }).toList(),
              onSelected: (index) {
                _changeFilter(index);
              },
            ),
          ),

          SizedBox(height: 20),

          Expanded(
            child:
                BlocConsumer<FlightReservationsBloc, FlightReservationsState>(
                  listener: (context, state) {
                    if (state.status.isError) {
                      Fluttertoast.showToast(msg: state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state.flights.isEmpty && !state.status.isLoading) {
                      return _buildEmpty(context);
                    }
                    return Skeletonizer(
                      enabled: state.status.isLoading,
                      child: RefreshIndicator(
                        onRefresh: () async {
                          context.read<FlightReservationsBloc>().add(
                            FlightReservationsEvent.fetchFlightBookings(),
                          );
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          shrinkWrap: true,
                          // itemExtent: screenHeight(context) * 0.28,
                          itemCount:
                              state.status.isLoading
                                  ? 10
                                  : state.flights.length,
                          itemBuilder: (_, index) {
                            if (state.status.isLoading) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: FlightBookingCard(
                                  reservation: Flight(),
                                  isBooking: true,
                                ),
                              );
                            } else {
                              final flight = state.flights[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: FlightBookingCard(
                                  isBooking: true,
                                  reservation: flight,
                                  isActivated: _currentIndex == 0,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<FlightReservationsBloc>().add(
          FlightReservationsEvent.fetchFlightBookings(),
        );
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: screenHeight(context) * 0.2),
            EmptyWidget(),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              'No bookings yet\n try booking some flights',
            ),
          ],
        ),
      ),
    );
  }

  void _changeFilter(int index) {
    setState(() {
      _currentIndex = index;
    });
    final resBloc = context.read<FlightReservationsBloc>();

    switch (index) {
      case 0:
        resBloc.add(FilterChanged(BookingStatus.activated));
        break;
      case 1:
        resBloc.add(FilterChanged(BookingStatus.unacceptable));
        break;
      case 2:
        resBloc.add(FilterChanged(BookingStatus.canceled));
        break;
    }
  }

  int _currentIndex = 0;
}
