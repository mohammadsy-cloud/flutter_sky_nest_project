import 'package:demo_project/common/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/utilities/app_utilities.dart';
import '../custom_card.dart';
import 'home_header.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: CustomScrollView(
        slivers: [
          _buildHeader(context),
          _buildCountries(),
          _buildBody(context),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildCountries() {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: screenWidth(context),
        height: screenHeight(context) * 0.13,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: screenWidth(context) * 0.2,
          padding: EdgeInsets.only(left: 10),
          itemCount: 10,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap:
                    () => context.goNamed(
                      Routes.browseHotelsByCountryRoute,
                      pathParameters: {'country': 'Syria'},
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: screenWidth(context) * 0.2,
                      height: screenHeight(context) * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/Balloon-Fiesta.webp',
                          ),
                        ),
                      ),
                    ),
                    Text('Syria'),
                  ],
                ),
              ),
            );
          },
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
                Icon(Icons.arrow_forward_ios, size: 25),
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
                      imagePath: 'assets/images/hotel_image1.jpeg',
                      title1: 'Popular Destinations',
                      title2: '12$index Destinations from',
                      title3: 'US\$${index + 1}50',
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
                Icon(Icons.arrow_forward_ios, size: 25),
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
              backgroundColor: Theme.of(context).colorScheme.primaryFixed,
              child: Stack(
                children: [
                  Positioned(
                    top: 70,
                    left: 90,
                    child: Image.asset(
                      color: Theme.of(context).colorScheme.primary,
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
                      context.goNamed(Routes.browseHotelsRoute);
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
                      context.goNamed(Routes.browseHotelsRoute);
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
