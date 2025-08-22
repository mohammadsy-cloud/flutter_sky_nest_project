import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/model/flight.dart';
import 'package:sky_nest/usecases/home/viewmodel/home_bloc/home_bloc.dart';

import '../../../../common/widgets/blurred_dialog.dart';
import '../../repo/user_flights/user_flights_repo.dart';
import '../../viewmodel/flight_details_cubit/flight_details_cubit.dart';

class FlightDetailsPage extends StatefulWidget {
  const FlightDetailsPage({super.key, required this.flight});
  final Flight flight;

  @override
  State<FlightDetailsPage> createState() => _FlightDetailsPageState();
}

class _FlightDetailsPageState extends State<FlightDetailsPage> {
  @override
  void initState() {
    _flightDetailsCubit = FlightDetailsCubit(
      flight: widget.flight,
      userFlightsRepo: UserFlightsRepo(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<FlightDetailsCubit, FlightDetailsState>(
            bloc: _flightDetailsCubit,
            listener: (context, state) {
              if (state.status.isLoading) {
                LoadingIndicator().show(context);
              } else {
                LoadingIndicator().hideAll();
                if (state.status.isError) {
                  Fluttertoast.showToast(msg: state.message);
                }
              }
            },
            child: IconButton(
              onPressed: () {
                _flightDetailsCubit.fetchFlightDetails();
              },
              icon: Icon(Icons.refresh),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          widget.flight.tripType ?? 'No flight',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: screenHeight(context) * 0.1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            BlocBuilder<FlightDetailsCubit, FlightDetailsState>(
              bloc: _flightDetailsCubit,
              builder: (context, state) {
                return (state.flight.flightImage != null &&
                        state.flight.flightImage!.length > 1)
                    ? SizedBox(
                      height: screenHeight(context) * 0.2,
                      child: ListView.builder(
                        itemCount: widget.flight.flightImage!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemExtent: screenWidth(context) * 0.7,
                        itemBuilder: (BuildContext context, int index) {
                          final image = widget.flight.flightImage![index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: CustomNetworkImage(
                                imagePath: image.imageUrl ?? '',
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    : Container(
                      height: screenHeight(context) * 0.23,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CustomNetworkImage(
                        imagePath: findFirstImageUrl(widget.flight.flightImage),
                      ),
                    );
              },
            ),
            _buildFromToPlaces(),
            Text(
              'Start date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Text(
              widget.flight.startingPointDate == null
                  ? 'No date'
                  : DateFormat(
                    DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY,
                  ).format(widget.flight.startingPointDate!),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Destination date:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.flight.destinationDate == null
                  ? 'No date'
                  : DateFormat(
                    DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY,
                  ).format(widget.flight.destinationDate!),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Num of chairs:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.flight.numberOfChairs == null
                  ? 'No num'
                  : widget.flight.numberOfChairs.toString(),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Num of empty chairs:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.flight.numberOfChairs == null
                  ? 'No num'
                  : widget.flight.numberOfEmptyChairs.toString(),
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Trip type:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.flight.tripType ?? 'No type',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Price:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            bestPriceWidget(
              fontWeight: FontWeight.bold,
              basePrice: widget.flight.basePrice ?? -1,
              currentPrice: widget.flight.currentPrice ?? 0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  screenWidth(context),
                  screenHeight(context) * 0.07,
                ),
              ),
              onPressed: () async {
                final isBooked = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return _buildDialog();
                  },
                );
                if (isBooked != null) {
                  if (isBooked) {
                    if (context.mounted) {
                      context.goNamed(Routes.mainRoute);
                    }
                  }
                }
              },
              child: Text('Book'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFromToPlaces() {
    return BlocBuilder<FlightDetailsCubit, FlightDetailsState>(
      bloc: _flightDetailsCubit,

      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'From',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  state.flight.startingPoint == null
                      ? 'No start'
                      : higherFirstChar(state.flight.startingPoint!),
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'To',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  state.flight.destination == null
                      ? 'No end'
                      : higherFirstChar(state.flight.destination!),
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialog() {
    return BlurredDialog(
      barrierDismissible: true,

      child: AlertDialog(
        content: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Number of people',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'number required';
                  } else {
                    return null;
                  }
                },
                controller: _numOfPeopleController,
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(hintText: 'Num of people'),
              ),
            ),
            BlocConsumer<FlightDetailsCubit, FlightDetailsState>(
              listener: (context, state) {
                LoadingIndicator().hideAll();
                if (state.status.isDone) {
                  Fluttertoast.showToast(msg: state.message);
                  context.read<HomeBloc>().add(
                    HomeEvent.nearbyFlightsFetched(),
                  );
                  context.pop<bool>(true);
                }
              },
              bloc: _flightDetailsCubit,
              builder: (context, state) {
                return state.status.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _flightDetailsCubit.flightReservation(
                            int.parse(_numOfPeopleController.text),
                          );
                        }
                      },
                      child: Text('Confirm'),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  late final FlightDetailsCubit _flightDetailsCubit;
  final _formKey = GlobalKey<FormState>();
  final _numOfPeopleController = TextEditingController();
}
