import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/utilities/enumirations.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/browse_hotel_card.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/browse_hotels_cubit/browse_hotels_cubit.dart';

class BrowseNearbyHotelsPage extends StatefulWidget {
  const BrowseNearbyHotelsPage({super.key});

  @override
  State<BrowseNearbyHotelsPage> createState() => _BrowseNearbyHotelsPageState();
}

class _BrowseNearbyHotelsPageState extends State<BrowseNearbyHotelsPage> {
  @override
  void initState() {
    super.initState();
    _browseHotelsCubit.fetchAllHotels();
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
          'Nearby hotels',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          _browseHotelsCubit.fetchAllHotels();
        },
        child: BlocBuilder<BrowseHotelsCubit, BrowseHotelsState>(
          bloc: _browseHotelsCubit,
          builder: (context, state) {
            if (state.hotels.isEmpty && !state.status.isLoading) {
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
                itemCount: state.status.isLoading ? 10 : state.hotels.length,
                itemBuilder: (_, index) {
                  if (state.status.isLoading) {
                    return BrowseHotelCard(hotel: Hotel());
                  }
                  final hotel = state.hotels[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.hotelInfoRoute, extra: hotel);
                    },
                    child: BrowseHotelCard(hotel: hotel),
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
              child: TextField(
                onChanged: (value) {
                  if (value.trim().isNotEmpty) {
                    _browseHotelsCubit.searchHotelsByLocation(value);
                  }
                },
                onSubmitted: (value) {
                  if (value.trim().isNotEmpty) {
                    _browseHotelsCubit.searchHotelsByLocation(value);
                  }
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
              ),
            ),
            GestureDetector(
              onTap: () {
                _browseHotelsCubit.fetchAllHotels();

                _searchController.clear();
              },
              child: Icon(Icons.cancel, size: 25),
            ),
          ],
        ),
      ),
    );
  }

  final BrowseHotelsCubit _browseHotelsCubit = BrowseHotelsCubit(
    userHotelRepo: UserHotelRepo(),
    isNearby: true,
  );
  final _searchController = TextEditingController();
}
