import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/utilities/enumirations.dart';
import 'package:sky_nest/usecases/home/model/reservation.dart';
import 'package:sky_nest/usecases/home/view/widgets/bookings/booking_card.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/view/widgets/select_widget.dart';

import '../../../viewmodel/hotel_reservations_bloc/hotel_reservations_bloc.dart';
import '../../../viewmodel/reservation_card_cubit/reservation_card_cubit.dart';

class ResevationsPage extends StatefulWidget {
  const ResevationsPage({super.key});

  @override
  State<ResevationsPage> createState() => _ResevationsPageState();
}

class _ResevationsPageState extends State<ResevationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<HotelReservationsBloc>().add(ReservationsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
            child: BlocConsumer<HotelReservationsBloc, HotelReservationsState>(
              listener: (context, state) {
                if (state.status.isError) {
                  Fluttertoast.showToast(msg: state.statusMessage);
                }
              },
              builder: (context, state) {
                if (state.reservations.isEmpty && !state.status.isLoading) {
                  return _buildEmpty(context);
                }
                return Skeletonizer(
                  enabled: state.status.isLoading,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<HotelReservationsBloc>().add(
                        ReservationsFetched(),
                      );
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      shrinkWrap: true,
                      // itemExtent: screenHeight(context) * 0.28,
                      itemCount:
                          state.status.isLoading
                              ? 10
                              : state.reservations.length,
                      itemBuilder: (_, index) {
                        if (state.status.isLoading) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: BookingCard(
                              reservation: Reservation(),
                              isBooking: true,
                            ),
                          );
                        } else {
                          final reservation = state.reservations[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: BookingCard(
                              isBooking: true,
                              reservation: reservation,
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
        context.read<HotelReservationsBloc>().add(ReservationsFetched());
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
              'No bookings yet\n try booking some rooms',
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
    final resBloc = context.read<HotelReservationsBloc>();

    switch (index) {
      case 0:
        resBloc.add(StatusChanged(status: BookingStatus.activated));
        break;
      case 1:
        resBloc.add(StatusChanged(status: BookingStatus.unacceptable));
        break;
      case 2:
        resBloc.add(StatusChanged(status: BookingStatus.canceled));
        break;
    }
  }

  int _currentIndex = 0;
}
