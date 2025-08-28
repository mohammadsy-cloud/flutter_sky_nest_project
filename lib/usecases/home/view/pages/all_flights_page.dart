import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/model/flight.dart';
import 'package:sky_nest/usecases/home/repo/user_flights/user_flights_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../../../common/navigation/routes.dart';
import '../../viewmodel/all_flights_cubit/all_flights_cubit.dart';

class AllFlightsPage extends StatefulWidget {
  const AllFlightsPage({super.key});

  @override
  State<AllFlightsPage> createState() => _AllFlightsPageState();
}

class _AllFlightsPageState extends State<AllFlightsPage> {
  @override
  void initState() {
    _allFlightsCubit = AllFlightsCubit(userFlightsRepo: UserFlightsRepo());
    super.initState();
    _allFlightsCubit.fetchFlights();
  }

  @override
  void dispose() {
    _startPointController.dispose();
    _endPointController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(Duration(days: 40)),
              );
              if (date != null) {
                _allFlightsCubit.changefilter(date: date);
              }
            },
            child: BlocConsumer<AllFlightsCubit, AllFlightsState>(
              bloc: _allFlightsCubit,
              listener: (context, state) {
                if (state.status.isError) {
                  Fluttertoast.showToast(msg: state.message);
                }
              },
              builder: (context, state) {
                return Text(
                  DateFormat(DateFormat.YEAR_MONTH_DAY).format(state.date),
                );
              },
            ),
          ),
        ],
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text(
          'All Flights',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _allFlightsCubit.fetchFlights();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              collapsedHeight: screenHeight(context) * 0.2,
              forceElevated: true,
              flexibleSpace: Column(
                spacing: 10,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      onChanged: (value) {
                        _allFlightsCubit.changefilter(start: value);
                      },
                      onSubmitted: (value) {
                        _allFlightsCubit.changefilter(start: value);
                      },
                      controller: _startPointController,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(hintText: 'Start Point'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_circle_down_sharp, size: 34),
                      Icon(Icons.arrow_circle_down_sharp, size: 34),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      textInputAction: TextInputAction.search,

                      onChanged: (value) {
                        _allFlightsCubit.changefilter(end: value);
                      },
                      onSubmitted: (value) {
                        _allFlightsCubit.changefilter(end: value);
                      },
                      controller: _endPointController,
                      decoration: InputDecoration(hintText: 'End Point'),

                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
              forceMaterialTransparency: true,
              toolbarHeight: screenHeight(context) * 0.2,
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<AllFlightsCubit, AllFlightsState>(
                bloc: _allFlightsCubit,
                builder: (context, state) {
                  if (state.flights.isEmpty && !state.status.isLoading) {
                    return Center(heightFactor: 4.5, child: EmptyWidget());
                  }
                  return Skeletonizer(
                    enabled: state.status.isLoading,
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemExtent: screenHeight(context) * 0.18,
                      itemCount:
                          state.status.isLoading ? 10 : state.flights.length,
                      itemBuilder: (_, index) {
                        if (state.status.isLoading) {
                          return _buildLoading(context);
                        }
                        final flight = state.flights[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                Routes.flightDetails,
                                extra: flight,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.tertiaryContainer,
                              ),
                              child: Row(
                                spacing: 10,
                                children: [
                                  Container(
                                    width: screenWidth(context) * 0.35,
                                    height: double.infinity,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: CustomNetworkImage(
                                      imagePath: findFirstImageUrl(
                                        flight.flightImage,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(flight.airportName ?? 'No name'),
                                      Row(
                                        children: [
                                          Text('From'),
                                          SizedBox(width: 10),
                                          Text(
                                            flight.startingPoint ?? 'No start',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('To'),
                                          SizedBox(width: 10),
                                          Text(flight.destination ?? 'No end'),
                                        ],
                                      ),
                                      bestPriceWidget(
                                        fontWeight: FontWeight.bold,
                                        basePrice: flight.basePrice ?? 0,
                                        currentPrice: flight.currentPrice ?? -1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildLoading(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Theme.of(context).colorScheme.tertiaryContainer,
        ),
        child: Row(
          spacing: 10,
          children: [
            Container(
              width: screenWidth(context) * 0.35,
              height: double.infinity,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.all(10),
              child: CustomNetworkImage(imagePath: 'imagePath'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('airport name'),
                Row(
                  children: [Text('From'), SizedBox(width: 10), Text('from')],
                ),
                Row(children: [Text('To'), SizedBox(width: 10), Text('to')]),
                Text('\$price'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final _startPointController = TextEditingController();
  final _endPointController = TextEditingController();
  late final AllFlightsCubit _allFlightsCubit;
}
