import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/usecases/home/model/hotel.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/all_rooms_cubit/all_rooms_cubit.dart';

import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/custom_network_image.dart';
import '../../repo/user_hotel/requests/show_all_rooms_request.dart';
import '../../viewmodel/cart_bloc/cart_bloc.dart';

class AllRoomsPage extends StatefulWidget {
  const AllRoomsPage({super.key});

  @override
  State<AllRoomsPage> createState() => _AllRoomsPageState();
}

class _AllRoomsPageState extends State<AllRoomsPage> {
  @override
  void dispose() {
    _searchController.dispose();
    _launchDateController.dispose();
    _departureDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _allRoomsCubit.fetchAllRooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text('All Rooms'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          spacing: 10,
          children: [
            TextField(
              onChanged: (value) {
                _allRoomsCubit.searchByAddress(query: value);
              },
              onSubmitted: (value) {
                _allRoomsCubit.searchByAddress(query: value);
              },
              controller: _searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search by address',
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                    _allRoomsCubit.searchByAddress(query: '');
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onTap: () async {
                  final timeRange = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now().add(Duration(days: 1)),
                    lastDate: DateTime.now().add(Duration(days: 90)),
                  );

                  if (timeRange != null) {
                    setState(() {
                      _timeRange = timeRange;
                    });
                    _allRoomsCubit.changeTimeRange(timeRange: timeRange);
                  }
                },
                textAlign: TextAlign.center,
                controller:
                    _launchDateController
                      ..text =
                          '${DateFormat.yMd().format(_timeRange.start)}     |'
                          '     ${DateFormat.yMd().format(_timeRange.end)}',
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.arrow_upward),
                  suffixIcon: Icon(Icons.arrow_downward),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<AllRoomsCubit, AllRoomsState>(
                bloc: _allRoomsCubit,
                builder: (context, state) {
                  if (state.rooms.isEmpty && !state.status.isLoading) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        _allRoomsCubit.fetchAllRooms();
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight(context) * 0.2),
                            EmptyWidget(),
                          ],
                        ),
                      ),
                    );
                  }
                  return Skeletonizer(
                    enabled: state.status.isLoading,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        _allRoomsCubit.fetchAllRooms();
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            state.status.isLoading ? 10 : state.rooms.length,
                        itemBuilder: (_, index) {
                          if (state.status.isLoading) {
                            return _buildLoadingPlaceHolder();
                          }
                          List<Widget> roomWidgets = [];
                          state.rooms.forEach((key, value) {
                            final hotel = key;
                            for (final room in value) {
                              roomWidgets.add(
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    context.pushNamed(
                                      Routes.roomDetails,
                                      extra: room.copyWith(hotelId: hotel.id),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.outline,
                                        ),
                                      ),
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: screenHeight(context) * 0.1,
                                            width: screenWidth(context) * 0.23,
                                            child: CustomNetworkImage(
                                              imagePath:
                                                  (room.imageDTOList ?? [])
                                                          .isEmpty
                                                      ? ''
                                                      : room
                                                              .imageDTOList
                                                              ?.first
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width:
                                                      screenWidth(context) *
                                                      0.4,
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    room.roomType ?? 'No Room',
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    style:
                                                        ((room.currentPrice ??
                                                                    -1) <
                                                                (room.basePrice ??
                                                                    0))
                                                            ? TextStyle(
                                                              decorationThickness:
                                                                  2,

                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                            )
                                                            : null,
                                                    text:
                                                        ((room.currentPrice ??
                                                                    -1) <
                                                                (room.basePrice ??
                                                                    0))
                                                            ? '\$ ${room.basePrice ?? 0.0}'
                                                            : '\$ ${room.currentPrice ?? 0.0}',
                                                    children:
                                                        ((room.currentPrice ??
                                                                    -1) <
                                                                (room.basePrice ??
                                                                    0))
                                                            ? [
                                                              TextSpan(
                                                                text:
                                                                    ' \$ ${room.currentPrice ?? 0.0}',
                                                                style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                ),
                                                              ),
                                                            ]
                                                            : null,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),

                                          BlocSelector<
                                            CartBloc,
                                            CartState,
                                            bool
                                          >(
                                            selector: (state) {
                                              return state.hotelRooms.isEmpty
                                                  ? false
                                                  : state
                                                          .hotelRooms[state
                                                              .hotelRooms
                                                              .keys
                                                              .firstWhere(
                                                                (h) {
                                                                  return hotel
                                                                          .id ==
                                                                      h.id;
                                                                },
                                                                orElse:
                                                                    () =>
                                                                        Hotel(),
                                                              )]
                                                          ?.any((r) {
                                                            return r.id ==
                                                                room.id;
                                                          }) ??
                                                      false;
                                            },
                                            builder: (context, exists) {
                                              return IconButton(
                                                tooltip: 'Cart',
                                                onPressed: () {
                                                  if (exists) {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          RemovedFromCart(
                                                            hotel: hotel,
                                                            room: room,
                                                          ),
                                                        );
                                                  } else {
                                                    context
                                                        .read<CartBloc>()
                                                        .add(
                                                          AddedToCart(
                                                            hotel: hotel,
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
                                ),
                              );
                            }
                          });
                          return Column(children: roomWidgets);
                        },
                      ),
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

  Padding _buildLoadingPlaceHolder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              height: screenHeight(context) * 0.1,
              width: screenWidth(context) * 0.23,
              child: CustomNetworkImage(imagePath: ''),
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
                    child: Text(overflow: TextOverflow.ellipsis, 'No Room'),
                  ),
                  Text(overflow: TextOverflow.ellipsis, '\$ ${0.0}'),
                ],
              ),
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

  final _searchController = TextEditingController();
  final _launchDateController = TextEditingController();
  DateTimeRange _timeRange = DateTimeRange(
    start: DateTime.now().add(Duration(days: 1)),
    end: DateTime.now().add(Duration(days: 2)),
  );
  final _departureDateController = TextEditingController();
  final _allRoomsCubit = AllRoomsCubit(userHotelRepo: UserHotelRepo());
}
