import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/cart_bloc/cart_bloc.dart';

import '../../../../common/utilities/app_utilities.dart';

class CartHotelRoomsPage extends StatefulWidget {
  const CartHotelRoomsPage({super.key, required this.hotel});
  final Hotel hotel;

  @override
  State<CartHotelRoomsPage> createState() => _CartHotelRoomsPageState();
}

class _CartHotelRoomsPageState extends State<CartHotelRoomsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartBloc>().state;
    return Scaffold(
      floatingActionButton:
          cartState.currentHotel!.value.isEmpty
              ? null
              : FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  context.pushNamed(Routes.completeReservation);
                },
              ),
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
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.currentHotel?.value.isEmpty ?? true) {
            return Center(heightFactor: 7.0, child: EmptyWidget());
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemExtent: screenHeight(context) * 0.15,
            itemCount: state.currentHotel?.value.length,
            itemBuilder: (_, index) {
              final room = state.currentHotel?.value[index];
              return Dismissible(
                onDismissed: (_) {
                  context.read<CartBloc>().add(
                    RemovedFromCart(hotel: widget.hotel, room: room),
                  );
                },
                key: ValueKey(room?.id ?? 0),
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
                          child: CustomNetworkImage(imagePath: ''),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(room?.roomType ?? 'No Room'),
                            Text('\$ ${room?.currentPrice ?? 0.0}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
