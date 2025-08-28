import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/usecases/home/model/airport.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../repo/user_airport/user_airport_repo.dart';
import '../../viewmodel/browse_airports_cubit/browse_airports_cubit.dart';
import '../widgets/browse_airport_card.dart';

class BrowseNearbyAirportsPage extends StatefulWidget {
  const BrowseNearbyAirportsPage({super.key});

  @override
  State<BrowseNearbyAirportsPage> createState() =>
      _BrowseNearbyAirportsPageState();
}

class _BrowseNearbyAirportsPageState extends State<BrowseNearbyAirportsPage> {
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
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text(
          'Nearby airports',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          _browseAirportsCubit.fetchAirports();
        },
        child: BlocBuilder<BrowseAirportsCubit, BrowseAirportsState>(
          bloc: _browseAirportsCubit,
          builder: (context, state) {
            if (state.airports.isEmpty && !state.status.isLoading) {
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Center(heightFactor: 7, child: EmptyWidget()),
              );
            }
            return Skeletonizer(
              enabled: state.status.isLoading,
              child: ListView.builder(
                shrinkWrap: true,
                itemExtent: screenHeight(context) * 0.19,
                itemCount: state.status.isLoading ? 10 : state.airports.length,
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
    isNearby: true,
    userAirportRepo: UserAirportRepo(),
  );
}
