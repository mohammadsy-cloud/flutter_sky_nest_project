import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/usecases/home/view/widgets/bookings/booking_card.dart';
import 'package:flutter/material.dart';
import 'package:sky_nest/usecases/home/view/widgets/bookings/resevations_page.dart';
import 'package:sky_nest/usecases/home/view/widgets/profile/profile_page.dart';
import 'package:sky_nest/usecases/home/viewmodel/profile_bloc/profile_bloc.dart';
import '../../../../common/navigation/routes.dart';
import '../widgets/bookings/flights_booking_page.dart';
import '../widgets/cart/my_cart_page.dart';
import '../widgets/home/home_screen_widget.dart';
import '../widgets/select_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _Maintate();
}

class _Maintate extends State<MainPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => context.read<ProfileBloc>().add(ProfileFetched()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _currentIndex == 0
              ? null
              : _currentIndex == 2
              ? AppBar(
                foregroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                title: Text(
                  'My Cart',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                toolbarHeight: screenHeight(context) * 0.08,
                actions: [
                  TextButton.icon(
                    onPressed: () {
                      context.pushNamed(Routes.allRooms);
                    },
                    label: Text('View Rooms'),
                    icon: Icon(Icons.add),
                  ),
                ],
              )
              : _currentIndex == 4
              ? AppBar(
                foregroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                backgroundColor: Theme.of(context).colorScheme.primary,
                centerTitle: true,
                title: Text('My profile'),
                toolbarHeight: screenHeight(context) * 0.08,
              )
              : AppBar(
                forceMaterialTransparency: true,
                title: Text(
                  _currentIndex == 1 ? 'Bookings' : 'Flight bookings',
                ),
                toolbarHeight: screenHeight(context) * 0.1,
              ),
      body:
          _currentIndex == 0
              ? HomeScreenWidget()
              : _currentIndex == 1
              ? ResevationsPage()
              : _currentIndex == 2
              ? MyCartPage()
              : _currentIndex == 3
              ? FlightsBookingPage()
              : ProfilePage(),
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        activeColor: Colors.black,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        style: TabStyle.fixedCircle,
        items: [
          TabItem(icon: Icon(Icons.home), title: 'Home'),
          TabItem(icon: Icon(Icons.book), title: 'Book'),
          TabItem(icon: Icon(Icons.shopping_cart), title: 'Cart'),
          TabItem(icon: Icon(Icons.flight), title: 'Flights'),
          TabItem(icon: Icon(Icons.person), title: 'Profile'),
        ],
      ),
    );
  }
}
