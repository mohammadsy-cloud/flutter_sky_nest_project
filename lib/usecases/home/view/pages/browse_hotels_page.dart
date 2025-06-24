import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/services/dependency_manager/dependency_manager.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/browse_hotels/browse_hotels_cubit.dart';

class BrowseHotelsPage extends StatefulWidget {
  const BrowseHotelsPage({super.key});

  @override
  State<BrowseHotelsPage> createState() => _BrowseHotelsPageState();
}

class _BrowseHotelsPageState extends State<BrowseHotelsPage> {
  @override
  void initState() {
    super.initState();
    _browseHotelsCubit.fetchAllHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          _browseHotelsCubit.fetchAllHotels();
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
              Align(
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
                        child: Icon(Icons.arrow_back_ios, size: 25),
                      ),
                      SizedBox(
                        width: screenWidth(context) * 0.6,
                        child: TextField(
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
                          //TODO clear the textfield
                        },
                        child: Icon(Icons.cancel, size: 35),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: screenHeight(context) * 0.8,
                child: BlocBuilder<BrowseHotelsCubit, BrowseHotelsState>(
                  bloc: _browseHotelsCubit,
                  builder: (context, state) {
                    if (state.hotels.isEmpty && !state.status.isLoading) {
                      return EmptyWidget();
                    }
                    return Skeletonizer(
                      enabled: state.status.isLoading,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemExtent: screenHeight(context) * 0.19,
                        itemCount:
                            state.status.isLoading ? 10 : state.hotels.length,
                        itemBuilder: (_, index) {
                          if (state.status.isLoading) {
                            return BrowseHotelCard(hotel: Hotel());
                          }
                          final hotel = state.hotels[index];
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                Routes.hotelInfoRoute,
                                pathParameters: {
                                  'hotelName': hotel.name ?? 'No hotel',
                                },
                              );
                            },
                            child: BrowseHotelCard(hotel: hotel),
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

  final BrowseHotelsCubit _browseHotelsCubit = BrowseHotelsCubit(
    userHotelRepo: UserHotelRepo(),
  );
}

class BrowseHotelCard extends StatelessWidget {
  const BrowseHotelCard({super.key, required this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth(context),
        height: screenHeight(context) * 0.19,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.outer,
              // color: Colors.black,
              spreadRadius: 0.2,
              offset: Offset(0.0, 1.0),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: screenWidth(context) * 0.28,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  alignment: Alignment(-0.5, 0.0),
                  image: AssetImage('assets/images/hotel_image1.jpeg'),
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RatingBar(
                      itemSize: 20,
                      ignoreGestures: true,
                      ratingWidget: RatingWidget(
                        full: Icon(Icons.star, color: Colors.amber),
                        half: Icon(
                          Icons.star_half_outlined,
                          color: Colors.amber,
                        ),
                        empty: Icon(Icons.star_border, color: Colors.amber),
                      ),
                      glowColor: Colors.amber,
                      initialRating: hotel.avgRating ?? 0.0,

                      onRatingUpdate: (value) {},
                    ),
                  ],
                ),
                Text(
                  hotel.name ?? 'No name',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_sharp),
                    Text(hotel.address ?? 'No address'),
                  ],
                ),
                Text(
                  '\$100/night',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
