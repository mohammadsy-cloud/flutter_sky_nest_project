import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../../../common/navigation/routes.dart';
import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/custom_network_image.dart';
import '../../model/hotel.dart';
import '../../viewmodel/hotel_places_cubit/hotel_places_cubit.dart';

class HotelPlacesPage extends StatefulWidget {
  const HotelPlacesPage({super.key, required this.hotel});
  final Hotel hotel;

  @override
  State<HotelPlacesPage> createState() => _HotelPlacesPageState();
}

class _HotelPlacesPageState extends State<HotelPlacesPage> {
  @override
  void initState() {
    super.initState();
    _hotelPlacesCubit = HotelPlacesCubit(hotel: widget.hotel);
    _hotelPlacesCubit.fetchAllPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text(widget.hotel.name ?? 'No hotel'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
      ),
      body: BlocConsumer<HotelPlacesCubit, HotelPlacesState>(
        bloc: _hotelPlacesCubit,
        listener: (context, state) {
          if (state.status.isError) {
            Fluttertoast.showToast(msg: state.statusMessage);
          }
        },
        builder: (context, state) {
          if (state.hotelPlaces.isEmpty) {
            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                _hotelPlacesCubit.fetchAllPlaces();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight(context) * 0.3),
                    EmptyWidget(),
                  ],
                ),
              ),
            );
          }
          return Skeletonizer(
            enabled: state.status.isLoading,
            child: RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                _hotelPlacesCubit.fetchAllPlaces();
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemExtent: screenHeight(context) * 0.15,
                itemCount:
                    state.status.isLoading ? 10 : state.hotelPlaces.length,
                itemBuilder: (_, index) {
                  if (state.status.isLoading) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: double.infinity,
                              width: screenWidth(context) * 0.23,
                              child: Center(),
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Room $index'),
                                Text(' \$1${index}0'),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    );
                  }
                  final place = state.hotelPlaces[index];
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.pushNamed(
                        Routes.photos,
                        extra:
                            (place.imagePlaceList ?? []).map((image) {
                              return image.imageUrl ?? '';
                            }).toList(),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: double.infinity,
                              width: screenWidth(context) * 0.23,
                              child: CustomNetworkImage(
                                imagePath:
                                    (place.imagePlaceList ?? []).isEmpty
                                        ? ''
                                        : (place.imagePlaceList ?? [])
                                                .first
                                                .imageUrl ??
                                            '',
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              width: screenWidth(context) * 0.4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    place.placeName ?? 'No place',
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,

                                    place.placeDescription ?? 'No description',
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              tooltip: 'Photo Album',
                              onPressed: () {},
                              icon: Icon(Icons.photo_album_sharp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  late final HotelPlacesCubit _hotelPlacesCubit;
}
