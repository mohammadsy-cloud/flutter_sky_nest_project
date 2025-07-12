import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';
import 'package:sky_nest/usecases/home/repo/user_rooms/user_rooms_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/cart_bloc/cart_bloc.dart';

import '../../../../common/utilities/app_utilities.dart';
import '../../viewmodel/hotel_rooms_cubit/hotel_rooms_cubit.dart';

class HotelRoomsPage extends StatefulWidget {
  const HotelRoomsPage({super.key, required this.hotel});
  final Hotel hotel;

  @override
  State<HotelRoomsPage> createState() => _HotelRoomsPageState();
}

class _HotelRoomsPageState extends State<HotelRoomsPage> {
  @override
  void initState() {
    super.initState();
    _hotelRoomsCubit = HotelRoomsCubit(
      hotel: widget.hotel,
      userRoomsRepo: UserRoomsRepo(),
    );

    _hotelRoomsCubit.fetchAlRooms();
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
      body: BlocConsumer<HotelRoomsCubit, HotelRoomsState>(
        bloc: _hotelRoomsCubit,
        listener: (context, state) {
          if (state.status.isError) {
            Fluttertoast.showToast(msg: state.statusMessage);
          }
        },
        builder: (context, state) {
          if (state.status.isEmpty) {
            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                _hotelRoomsCubit.fetchAlRooms();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Center(heightFactor: 7.0, child: EmptyWidget()),
              ),
            );
          }
          return Skeletonizer(
            enabled: state.status.isLoading,
            child: RefreshIndicator(
              onRefresh: () async {
                _hotelRoomsCubit.fetchAlRooms();
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemExtent: screenHeight(context) * 0.15,
                itemCount: state.status.isLoading ? 10 : state.rooms.length,
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
                              child: CustomNetworkImage(imagePath: ''),
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
                            IconButton(
                              tooltip: 'Cart',
                              onPressed: () {},
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final room = state.rooms[index];
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
                            child: CustomNetworkImage(
                              imagePath:
                                  (room.imageDTOList == null ||
                                          room.imageDTOList!.isEmpty)
                                      ? ''
                                      : (room.imageDTOList ?? [])
                                              .first
                                              .imageUrl ??
                                          '',
                            ),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: screenWidth(context) * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenWidth(context) * 0.4,
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    room.roomType ?? 'No Room',
                                  ),
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,

                                  '\$ ${room.currentPrice ?? 0.0}',
                                ),
                              ],
                            ),
                          ),
                          Spacer(),

                          BlocSelector<CartBloc, CartState, bool>(
                            selector: (state) {
                              return state.hotelRooms[widget.hotel]?.contains(
                                    room,
                                  ) ??
                                  false;
                            },
                            builder: (context, exists) {
                              return IconButton(
                                tooltip: 'Cart',
                                onPressed: () {
                                  if (exists) {
                                    context.read<CartBloc>().add(
                                      RemovedFromCart(
                                        hotel: widget.hotel,
                                        room: room,
                                      ),
                                    );
                                  } else {
                                    context.read<CartBloc>().add(
                                      AddedToCart(
                                        hotel: widget.hotel,
                                        room: room,
                                      ),
                                    );
                                  }
                                },
                                icon:
                                    exists ? Icon(Icons.done) : Icon(Icons.add),
                              );
                            },
                          ),
                        ],
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

  late final HotelRoomsCubit _hotelRoomsCubit;
}
