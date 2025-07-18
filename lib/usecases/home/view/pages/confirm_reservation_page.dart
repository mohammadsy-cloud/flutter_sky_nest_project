import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/model/reservation.dart';
import 'package:sky_nest/usecases/home/view/widgets/bookings/booking_card.dart';
import 'package:sky_nest/usecases/home/view/widgets/custom_card.dart';
import 'package:sky_nest/usecases/home/view/widgets/custom_hotel_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/routes.dart';
import '../../repo/user_hotel/requests/booking_rooms_request.dart';
import '../../viewmodel/cart_bloc/cart_bloc.dart';

class ConfirmReservationPage extends StatefulWidget {
  const ConfirmReservationPage({super.key, required this.hotelName});
  final String hotelName;

  @override
  State<ConfirmReservationPage> createState() => _ConfirmReservationPageState();
}

class _ConfirmReservationPageState extends State<ConfirmReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: screenHeight(context) * 0.08,
        title: Text(
          'Confirm & Pay',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingCard(reservation: Reservation()),
              SizedBox(height: 20),
              Text(
                'Your Booking details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Number of rooms', style: TextStyle(fontSize: 16)),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Price Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$120 x 3 nights',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    '\$360',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Discount',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  Text(
                    '\$50.00',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Grand Total',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$310',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: screenWidth(context) * 0.7,
                  height: screenHeight(context) * 0.07,
                  child: BlocConsumer<CartBloc, CartState>(
                    listener: (context, state) {
                      if (state.status.isLoading) {
                        LoadingIndicator().show(context);
                      } else {
                        LoadingIndicator().hideAll();
                        if (state.status.isError) {
                          Fluttertoast.showToast(msg: state.statusMessage);
                        }
                        if (state.status.isDone) {
                          Fluttertoast.showToast(msg: state.statusMessage);
                          context.goNamed(Routes.mainRoute);
                        }
                      }
                    },
                    builder: (context, state) {
                      return FilledButton(
                        onPressed: () {
                          // context.read<CartBloc>().add(
                          //   ReservationCompleted(
                          //     request: BookingRoomsRequest(),
                          //   ),
                          // );
                        },
                        child: Text('Pay now', style: TextStyle(fontSize: 16)),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
