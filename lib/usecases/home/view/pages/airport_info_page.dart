import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/blurred_dialog.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/usecases/home/model/airport.dart';
import 'package:sky_nest/usecases/home/model/flight.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../repo/user_flights/user_flights_repo.dart';
import '../../viewmodel/airport_info_cubit/airport_info_cubit.dart';

class AirportInfoPage extends StatefulWidget {
  const AirportInfoPage({super.key, required this.airport});
  final Airport airport;

  @override
  State<AirportInfoPage> createState() => _AirportInfoPageState();
}

class _AirportInfoPageState extends State<AirportInfoPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _airportInfoCubit = AirportInfoCubit(
      airport: widget.airport,
      userFlightsRepo: UserFlightsRepo(),
    );
    super.initState();
    _airportInfoCubit.fetchFlights();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() async {
      if (_tabController.index == 1) {
        _airportInfoCubit.fetchFlights();
      }
      if (_tabController.index == 0) {
        _flights.clear();
      }
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    _startPointController.dispose();
    _endPointController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text(widget.airport.name ?? 'No name'),
        bottom: PreferredSize(
          preferredSize: Size(
            screenWidth(context),
            screenHeight(context) * 0.03,
          ),
          child: TabBar(
            controller: _tabController,
            tabs: [
              Text('Info', style: TextStyle(fontSize: 18)),
              Text('Flights', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildInfoTab(),
          Container(
            padding: EdgeInsets.all(10),
            child: RefreshIndicator(
              onRefresh: () async {
                _airportInfoCubit.fetchFlights();
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
                              _airportInfoCubit.changeQuery(startPoint: value);
                            },
                            onSubmitted: (value) {
                              _airportInfoCubit.changeQuery(startPoint: value);
                            },
                            controller: _startPointController,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'Start Point',
                            ),
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
                              _airportInfoCubit.changeQuery(endPoint: value);
                            },
                            onSubmitted: (value) {
                              _airportInfoCubit.changeQuery(endPoint: value);
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
                    child: BlocConsumer<AirportInfoCubit, AirportInfoState>(
                      bloc: _airportInfoCubit,
                      builder: (context, state) {
                        if (state.flights.isEmpty && !state.status.isLoading) {
                          return Center(
                            heightFactor: 4.5,
                            child: EmptyWidget(),
                          );
                        }
                        return Skeletonizer(
                          enabled: state.status.isLoading,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 10),
                            shrinkWrap: true,
                            key: _key,
                            itemCount:
                                state.status.isLoading
                                    ? 10
                                    : state.flights.length,
                            itemBuilder: (_, index) {
                              if (state.status.isLoading) {
                                return _buildLoading(index);
                              }
                              final flight = state.flights[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    context.pushNamed(
                                      Routes.flightDetails,
                                      extra: flight,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.tertiaryContainer,
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    height: screenHeight(context) * 0.14,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      spacing: 15,
                                      children: [
                                        Container(
                                          height: double.infinity,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            color:
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onTertiaryContainer,
                                          ),
                                          child: CustomNetworkImage(
                                            imagePath: findFirstImageUrl(
                                              flight.flightImage,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              flight.startingPointDate == null
                                                  ? ''
                                                  : DateFormat(
                                                    DateFormat
                                                        .YEAR_ABBR_MONTH_DAY,
                                                  ).format(
                                                    flight.startingPointDate!,
                                                  ),
                                            ),
                                            Text(flight.destination.toString()),
                                            bestPriceWidget(
                                              basePrice: flight.basePrice ?? -1,
                                              currentPrice:
                                                  flight.currentPrice ?? 0,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Icon(Icons.arrow_forward_ios),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      listener: (BuildContext context, AirportInfoState state) {
                        if (state.status.isError) {
                          Fluttertoast.showToast(msg: state.message);
                        }
                      },
                      listenWhen: (previous, current) {
                        return previous.flights != current.flights;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildLoading(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0, top: index == 0 ? 10 : 0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(13),
        ),
        height: screenHeight(context) * 0.14,
        padding: EdgeInsets.all(10),
        child: Row(
          spacing: 15,
          children: [
            Container(
              height: double.infinity,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Theme.of(context).colorScheme.onTertiaryContainer,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('askdasjidjsad'),
                Text('askdasjidjsad'),
                Text('askdasjidjsad'),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _buildInfoTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom * 0.3,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          spacing: 10,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: screenHeight(context) * 0.25,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(13),
              ),
              child:
                  (widget.airport.airportImages ?? []).isEmpty
                      ? Center()
                      : CustomNetworkImage(
                        imagePath:
                            widget.airport.airportImages?.first.imageUrl ?? '',
                      ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar(
                    itemSize: 30,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star, color: Colors.amber),
                      half: Icon(Icons.star_half, color: Colors.amber),
                      empty: Icon(
                        Icons.star_border_outlined,
                        color: Colors.amber,
                      ),
                    ),
                    ignoreGestures: true,
                    initialRating: widget.airport.avgRating ?? 0.0,
                    onRatingUpdate: (newRating) {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showRateDialog(context);
                    },
                    child: Text('Rate'),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Description:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            Container(
              width: screenWidth(context),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                style: TextStyle(fontSize: 17),
                widget.airport.description ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Location:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),

            Container(
              width: screenWidth(context),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                style: TextStyle(fontSize: 17),
                widget.airport.location ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Photos',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                IconButton(
                  iconSize: 24,
                  onPressed: () {
                    context.pushNamed(
                      Routes.photos,
                      extra:
                          (widget.airport.airportImages ?? []).map((image) {
                            return image.imageUrl ?? '';
                          }).toList(),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),

            if ((widget.airport.airportImages ?? []).isNotEmpty)
              SizedBox(
                height: screenHeight(context) * 0.13,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: (widget.airport.airportImages ?? []).length,
                  itemExtent: screenWidth(context) * 0.5,
                  itemBuilder: (_, index) {
                    final photo = widget.airport.airportImages![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.amber,
                        ),
                        child: CustomNetworkImage(
                          imagePath: photo.imageUrl ?? '',
                        ),
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

  Future<dynamic> _showRateDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (_) {
        double? rating;
        return BlurredDialog(
          child: AlertDialog(
            content: SizedBox(
              width: screenWidth(context) * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Text(
                    'Give this airport a rate',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RatingBar(
                      itemSize: 30,
                      ratingWidget: RatingWidget(
                        full: Icon(Icons.star, color: Colors.amber),
                        half: Icon(Icons.star_half, color: Colors.amber),
                        empty: Icon(
                          Icons.star_border_outlined,
                          color: Colors.amber,
                        ),
                      ),
                      initialRating: widget.airport.avgRating ?? 0.0,
                      onRatingUpdate: (newRating) {
                        rating = newRating;
                      },
                    ),
                  ),
                  Text('Comment'),
                  TextField(
                    textInputAction: TextInputAction.done,
                    controller: _commentController,
                    maxLines: 3,
                    maxLength: 100,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.pop();
                        },
                        child: Text('Close'),
                      ),
                      TextButton(onPressed: () {}, child: Text('Submit')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  late final TabController _tabController;
  final _commentController = TextEditingController();
  final _startPointController = TextEditingController();
  final _endPointController = TextEditingController();
  final _key = GlobalKey<SliverAnimatedListState>();
  List<Flight> _flights = [];
  late final AirportInfoCubit _airportInfoCubit;
}
