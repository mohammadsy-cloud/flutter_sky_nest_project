import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/widgets/delayed_display.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../../../../common/utilities/app_utilities.dart';
import '../../../viewmodel/home_bloc/home_bloc.dart';
import '../custom_card.dart';
import 'home_header.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<HomeBloc>().add(NearbyHotelsFetched()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(NearbyHotelsFetched());
        },
        child: CustomScrollView(
          slivers: [_buildHeader(context), _buildBody(context)],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hotels near you', style: TextStyle(fontSize: 20)),
                Icon(Icons.arrow_forward_ios, size: 20),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * 0.25,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.hotelsList.isEmpty &&
                      !state.hotelsListStatus.isLoading) {
                    return EmptyWidget();
                  }
                  return Skeletonizer(
                    enabled: state.hotelsListStatus.isLoading,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: screenWidth(context) * 0.5,
                      itemCount:
                          state.hotelsListStatus.isLoading
                              ? 5
                              : state.hotelsList.length,
                      itemBuilder: (_, index) {
                        if (state.hotelsListStatus.isLoading) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomCard(
                              imagePath: 'assets/images/hotel_image1.jpeg',
                              title1: 'Popular Destinations',
                              title2: '12$index Destinations from',
                              title3: 'US\$${index + 1}50',
                            ),
                          );
                        }
                        final hotel = state.hotelsList[index];
                        return TweenAnimationBuilder(
                          tween: Tween<double>(begin: 0.0, end: 1.0),
                          duration: Duration(milliseconds: 500),
                          builder: (context, value, child) {
                            return Opacity(opacity: value, child: child);
                          },
                          child: DelayedDisplay(
                            delay: 100 * index,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomCard(
                                onTap: () {
                                  context.pushNamed(
                                    Routes.hotelInfoRoute,
                                    extra: hotel,
                                  );
                                },
                                imagePath:
                                    (hotel.imageDTOList ?? []).isEmpty
                                        ? ''
                                        : hotel.imageDTOList?.first.imageUrl ??
                                            '',
                                title1: hotel.name ?? 'No name',
                                title2: hotel.description ?? 'No description',
                                title3: 'US\$${index + 1}50',
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Airports near you', style: TextStyle(fontSize: 20)),
                Icon(Icons.arrow_forward_ios, size: 20),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context) * 0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: screenWidth(context) * 0.5,
                itemCount: 5,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomCard(
                      imagePath: 'assets/images/airport.jpeg',
                      title1: 'Popular Destinations',
                      title2: '12$index Destinations from',
                      title3: 'US\$${index + 1}50',
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

  SliverAppBar _buildHeader(BuildContext context) {
    return SliverAppBar(
      leading: null,
      toolbarHeight: screenHeight(context) * 0.31,
      titleSpacing: 0,
      stretch: true,
      flexibleSpace: SizedBox(
        width: screenWidth(context),
        height: screenHeight(context) * 0.33,
        child: Stack(
          children: [
            HomeHeaderWidget(
              size: Size(screenWidth(context), screenHeight(context) * 0.3),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Stack(
                children: [
                  Positioned(
                    right: 13,
                    top: 25,
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(Routes.notifications);
                      },
                      child: Stack(
                        children: [
                          Icon(
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 30,
                            Icons.notifications,
                          ),
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              return Visibility(
                                visible: state.notificationCount != 0,
                                child: Positioned(
                                  top: 22,
                                  right: 10,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 90,
                    child: Image.asset(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      'assets/images/app_logo_skynest.png',
                      height: screenHeight(context) * 0.1,
                      width: screenWidth(context) * 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 58,
              top: screenHeight(context) * 0.18,
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      context.pushNamed(Routes.browseHotelsRoute);
                    },
                    child: Container(
                      width: screenWidth(context) * 0.33,
                      height: screenHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/icons/icons8-flight-50.png',
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                          Text(
                            'Flights',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      context.pushNamed(Routes.browseHotelsRoute);
                    },
                    child: Container(
                      width: screenWidth(context) * 0.33,
                      height: screenHeight(context) * 0.13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/icons/icons8-hotel-50.png',
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                          Text('Hotels', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  // SliverToBoxAdapter _buildCountries() {
  //   return SliverToBoxAdapter(
  //     child: SizedBox(
  //       width: screenWidth(context),
  //       height: screenHeight(context) * 0.13,
  //       child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemExtent: screenWidth(context) * 0.2,
  //         padding: EdgeInsets.only(left: 10),
  //         itemCount: 10,
  //         itemBuilder: (_, index) {
  //           return Padding(
  //             padding: const EdgeInsets.only(right: 8.0),
  //             child: GestureDetector(
  //               behavior: HitTestBehavior.opaque,
  //               onTap:
  //                   () => context.pushNamed(
  //                     Routes.browseHotelsByCountryRoute,
  //                     pathParameters: {'country': 'Syria'},
  //                   ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                 children: [
  //                   Container(
  //                     width: screenWidth(context) * 0.2,
  //                     height: screenHeight(context) * 0.08,
  //                     decoration: BoxDecoration(
  //                       color: Colors.amber,
  //                       borderRadius: BorderRadius.circular(12),
  //                       image: DecorationImage(
  //                         fit: BoxFit.cover,
  //                         image: AssetImage(
  //                           'assets/images/Balloon-Fiesta.webp',
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   Text('Syria'),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
