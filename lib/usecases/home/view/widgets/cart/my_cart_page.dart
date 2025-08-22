import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../../viewmodel/cart_bloc/cart_bloc.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.hotelRooms.isEmpty) {
          return Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyWidget(),
              Text(
                textAlign: TextAlign.center,
                'No rooms added yet \n try adding one!',
              ),
            ],
          );
        }
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          itemCount: state.hotelRooms.length,
          itemExtent: screenHeight(context) * 0.2,
          itemBuilder: (_, index) {
            final hotel = state.hotelRooms.keys.toList()[index];
            return Dismissible(
              key: ObjectKey(Text(index.toString())),
              onDismissed:
                  (_) => context.read<CartBloc>().add(
                    RemovedFromCart(hotel: hotel),
                  ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(CurrentHotelSet(hotel: hotel));
                    context.pushNamed(Routes.cartHotelRooms, extra: hotel);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.tertiary.withAlpha(150),
                          spreadRadius: 0.3,
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.secondaryContainer,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      spacing: 20,
                      children: [
                        Container(
                          height: double.infinity,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorPallete.grayColor,
                          ),
                          child: CustomNetworkImage(
                            imagePath:
                                (hotel.imageDTOList ?? []).isEmpty
                                    ? ''
                                    : hotel.imageDTOList?.first.imageUrl ?? '',
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(hotel.name ?? ''),
                            Text(hotel.description ?? ''),
                            Text(hotel.address ?? ''),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  final List _list = List.generate(10, (index) {
    return index;
  });
}
