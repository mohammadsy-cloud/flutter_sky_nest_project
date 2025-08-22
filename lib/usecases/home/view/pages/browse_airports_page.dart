import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/utilities/enumirations.dart';
import 'package:sky_nest/usecases/home/model/airport.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/browse_hotel_card.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/browse_hotels_cubit/browse_hotels_cubit.dart';

import '../../repo/user_airport/user_airport_repo.dart';
import '../../viewmodel/browse_airports_cubit/browse_airports_cubit.dart';
import '../widgets/browse_airport_card.dart';

class BrowseAirportsPage extends StatefulWidget {
  const BrowseAirportsPage({super.key});

  @override
  State<BrowseAirportsPage> createState() => _BrowseAirportsPageState();
}

class _BrowseAirportsPageState extends State<BrowseAirportsPage> {
  @override
  void initState() {
    _browseAirportsCubit.fetchAirports();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          _browseAirportsCubit.fetchAirports();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          hitTestBehavior: HitTestBehavior.opaque,
          padding: EdgeInsets.only(
            top: screenHeight(context) * 0.1,
            left: 5,
            right: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSearchBar(),
              SizedBox(height: 20),
              Align(
                heightFactor: 0.5,
                alignment: AlignmentDirectional(0.85, 0.0),
                child: BlocConsumer<BrowseAirportsCubit, BrowseAirportsState>(
                  bloc: _browseAirportsCubit,
                  builder: (context, state) {
                    return DropdownButton<Filter>(
                      value: state.filter,
                      items: [
                        DropdownMenuItem<Filter>(
                          value: Filter.all,
                          child: Text('All'),
                        ),
                        DropdownMenuItem<Filter>(
                          value: Filter.rating,
                          child: Text('rating'),
                        ),
                      ],
                      onChanged: (option) {
                        if (option != null) {
                          if (option.isRating) {
                            _searchController.clear();
                          }
                          _browseAirportsCubit.changeFilter(option);
                        }
                      },
                    );
                  },
                  listener: (BuildContext context, BrowseAirportsState state) {
                    if (state.status.isError) {
                      Fluttertoast.showToast(msg: state.message);
                    }
                  },
                ),
              ),
              SizedBox(
                height: screenHeight(context) * 0.8,
                child: BlocBuilder<BrowseAirportsCubit, BrowseAirportsState>(
                  bloc: _browseAirportsCubit,
                  builder: (context, state) {
                    if (state.airports.isEmpty && !state.status.isLoading) {
                      return EmptyWidget();
                    }
                    return Skeletonizer(
                      enabled: state.status.isLoading,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemExtent: screenHeight(context) * 0.19,
                        itemCount:
                            state.status.isLoading ? 10 : state.airports.length,
                        itemBuilder: (_, index) {
                          if (state.status.isLoading) {
                            return BrowseAirportCard(airport: Airport());
                          }
                          final airport = state.airports[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context.pushNamed(
                                Routes.airportInfoRoute,
                                extra: airport,
                              );
                            },
                            child: BrowseAirportCard(airport: airport),
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
      ),
    );
  }

  Align _buildSearchBar() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: screenWidth(context) * 0.85,
        height: screenHeight(context) * 0.06,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: ColorPallete.grayColor.withAlpha(100),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Icon(Icons.arrow_back_ios, size: 20),
            ),
            SizedBox(
              width: screenWidth(context) * 0.5,
              child:
                  BlocSelector<BrowseAirportsCubit, BrowseAirportsState, bool>(
                    bloc: _browseAirportsCubit,
                    selector: (state) {
                      return state.filter.isRating;
                    },
                    builder: (context, state) {
                      return TextField(
                        readOnly: state,
                        onChanged: (value) {
                          _browseAirportsCubit.searchAirports(value);
                        },
                        onSubmitted: (value) {
                          _browseAirportsCubit.searchAirports(value);
                        },
                        textInputAction: TextInputAction.search,
                        controller: _searchController,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          filled: false,
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          fillColor: Colors.transparent,
                        ),
                      );
                    },
                  ),
            ),
            GestureDetector(
              onTap: () {
                _searchController.clear();
                _browseAirportsCubit.searchAirports('');
              },
              child: Icon(Icons.cancel, size: 25),
            ),
          ],
        ),
      ),
    );
  }

  final _searchController = TextEditingController();
  final _browseAirportsCubit = BrowseAirportsCubit(
    userAirportRepo: UserAirportRepo(),
  );
}
