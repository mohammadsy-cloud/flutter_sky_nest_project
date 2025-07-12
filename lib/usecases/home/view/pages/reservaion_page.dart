import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/viewmodel/cart_bloc/cart_bloc.dart';

import '../../../../common/navigation/routes.dart';
import '../../../../common/utilities/app_utilities.dart';
import '../../repo/user_hotel/requests/booking_rooms_request.dart';

class ReservaionPage extends StatefulWidget {
  const ReservaionPage({super.key});

  @override
  State<ReservaionPage> createState() => _ReservaionPageState();
}

class _ReservaionPageState extends State<ReservaionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final numberOfRooms =
          context.read<CartBloc>().state.currentHotel?.value.length;
      _numberOfRoomsController.text = numberOfRooms.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Complete Your Reservation',
          style: TextStyle(fontSize: 18),
        ),
        toolbarHeight: screenHeight(context) * 0.08,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          20,
          20,
          20,
          MediaQuery.of(context).viewInsets.bottom * 0.3,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Number Of People'),
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Enter a valid number';
                      } else {
                        return null;
                      }
                    },
                    controller: _numberOfPeopleController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Number Of Rooms'),
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Enter a valid number';
                      } else {
                        return null;
                      }
                    },
                    readOnly: true,
                    controller: _numberOfRoomsController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Launch Date'),
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Enter a valid Date';
                      } else {
                        return null;
                      }
                    },
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now().add(Duration(days: 1)),
                        lastDate: (DateTime.now()).add(Duration(days: 30)),
                      );
                      if (date != null) {
                        setState(() {
                          _launchDate = date;
                        });
                        _launchDateController.text = DateFormat.yMMMMEEEEd()
                            .format(date);
                      }
                    },
                    controller: _launchDateController,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Departure Date'),
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Enter a valid Date';
                      } else {
                        return null;
                      }
                    },
                    controller: _departureDateController,
                    readOnly: true,
                    onTap:
                        _launchDate == null
                            ? null
                            : () async {
                              final date = await showDatePicker(
                                context: context,
                                firstDate: _launchDate!.add(Duration(days: 1)),
                                lastDate: _launchDate!.add(Duration(days: 30)),
                              );
                              if (date != null) {
                                setState(() {
                                  _departureDate = date;
                                });
                                _departureDateController.text =
                                    DateFormat.yMMMMEEEEd().format(date);
                              }
                            },

                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payment Ratio'),
                  Slider(
                    min: 20,
                    max: 100,
                    divisions: 8,
                    label: _paymentRatioValue.toInt().toString(),
                    value: _paymentRatioValue,
                    onChanged:
                        (value) => setState(() {
                          _paymentRatioValue = value;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('20'), Text('100')],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BlocConsumer<CartBloc, CartState>(
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
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        screenWidth(context),
                        screenHeight(context) * 0.07,
                      ),
                    ),
                    onPressed: () {
                      if (_launchDate != null &&
                          _departureDate != null &&
                          validateFormKey(_formKey)) {
                        context.read<CartBloc>().add(
                          ReservationCompleted(
                            request: BookingRoomsRequest(
                              numberOfRoom: int.parse(
                                _numberOfRoomsController.text,
                              ),
                              numberOfPerson: int.parse(
                                _numberOfPeopleController.text,
                              ),
                              launchDate: _launchDate!,
                              departureDate: _departureDate!,
                              paymentRatio: _paymentRatioValue.toInt(),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text('Book', style: TextStyle(fontSize: 15)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _paymentRatioValue = 20.0;
  final _numberOfPeopleController = TextEditingController();
  final _numberOfRoomsController = TextEditingController();
  final _launchDateController = TextEditingController();
  DateTime? _launchDate;
  DateTime? _departureDate;
  final _departureDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
}
