import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
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
        toolbarHeight: screenHeight(context) * 0.12,
        title: Text(widget.hotel.name ?? 'No hotel'),
        actions: [
          TextButton.icon(
            label: Text('All'),
            onPressed:
                _dateTimeRange == null
                    ? null
                    : () {
                      setState(() {
                        _hotelRoomsCubit.setTimeRange(_dateTimeRange = null);
                      });
                    },
            icon: Icon(Icons.clear_all),
          ),
        ],
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
        bottom: PreferredSize(
          preferredSize: Size(
            screenWidth(context),
            screenHeight(context) * 0.07,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: TextField(
              onTap: () async {
                final timeRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now().add(Duration(days: 1)),
                  lastDate: DateTime.now().add(Duration(days: 90)),
                );

                if (timeRange != null) {
                  setState(() {
                    _dateTimeRange = timeRange;
                  });
                  _hotelRoomsCubit.setTimeRange(timeRange);
                }
              },
              textAlign: TextAlign.center,
              controller:
                  _dateController
                    ..text =
                        '${_dateTimeRange == null ? 'any' : DateFormat.yMd().format(_dateTimeRange!.start)}     |'
                        '     ${_dateTimeRange == null ? 'any' : DateFormat.yMd().format(_dateTimeRange!.end)}',
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.arrow_upward),
                suffixIcon: Icon(Icons.arrow_downward),
              ),
            ),
          ),
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
          if (state.rooms.isEmpty && !state.status.isLoading) {
            return RefreshIndicator(
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: () async {
                _hotelRoomsCubit.fetchAlRooms();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Center(heightFactor: 5.0, child: EmptyWidget()),
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
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.pushNamed(
                        Routes.roomDetails,
                        extra: room.copyWith(
                          hotelName: widget.hotel.name,
                          hotelId: widget.hotel.id,
                        ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: screenWidth(context) * 0.4,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      room.roomType ?? 'No Room',
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      style:
                                          ((room.currentPrice ?? -1) <
                                                  (room.basePrice ?? 0))
                                              ? TextStyle(
                                                decorationThickness: 2,

                                                decoration:
                                                    TextDecoration.lineThrough,
                                              )
                                              : null,
                                      text:
                                          ((room.currentPrice ?? -1) <
                                                  (room.basePrice ?? 0))
                                              ? '\$ ${room.basePrice ?? 0.0}'
                                              : '\$ ${room.currentPrice ?? 0.0}',
                                      children:
                                          ((room.currentPrice ?? -1) <
                                                  (room.basePrice ?? 0))
                                              ? [
                                                TextSpan(
                                                  text:
                                                      ' \$ ${room.currentPrice ?? 0.0}',
                                                  style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                  ),
                                                ),
                                              ]
                                              : null,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),

                            BlocSelector<CartBloc, CartState, bool>(
                              selector: (state) {
                                return state
                                        .hotelRooms[state.hotelRooms.keys
                                            .firstWhere((h) {
                                              return h.id == widget.hotel.id;
                                            }, orElse: () => Hotel())]
                                        ?.any((r) {
                                          return room.id == r.id;
                                        }) ??
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
                                      exists
                                          ? Icon(Icons.done)
                                          : Icon(Icons.add),
                                );
                              },
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
      floatingActionButton: BlocSelector<CartBloc, CartState, bool>(
        selector: (state) {
          return state.hotelRooms.keys.any((h) {
            return h.id == widget.hotel.id;
          });
        },
        builder: (context, hotelExsistsInCart) {
          return BlocBuilder<HotelRoomsCubit, HotelRoomsState>(
            bloc: _hotelRoomsCubit,
            builder: (context, state) {
              return Visibility(
                visible: hotelExsistsInCart && !state.status.isLoading,
                child: FloatingActionButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                      CurrentHotelSet(hotel: widget.hotel),
                    );
                    context.pushNamed(Routes.completeReservation);
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              );
            },
          );
        },
      ),
    );
  }

  late final HotelRoomsCubit _hotelRoomsCubit;
  DateTimeRange? _dateTimeRange;
  final _dateController = TextEditingController();
}
