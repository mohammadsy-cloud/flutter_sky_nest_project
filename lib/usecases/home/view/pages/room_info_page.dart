import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/blurred_dialog.dart';
import 'package:sky_nest/common/widgets/counter_widget.dart';
import 'package:sky_nest/common/widgets/custom_divider.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/model/room.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/custom_date_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import 'package:sky_nest/usecases/home/viewmodel/cart_bloc/cart_bloc.dart';

import '../../../../common/navigation/routes.dart';
import '../../model/hotel.dart';
import '../../viewmodel/hotel_info_cubit/hotel_info_cubit.dart';
import '../../viewmodel/room_info_cubit/room_info_cubit.dart';

class RoomInfoPage extends StatefulWidget {
  const RoomInfoPage({super.key, required this.room});
  final Room room;

  @override
  State<RoomInfoPage> createState() => _RoomInfoPageState();
}

class _RoomInfoPageState extends State<RoomInfoPage> {
  @override
  void initState() {
    _roomInfoCubit = RoomInfoCubit(room: widget.room);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _roomInfoCubit.fetchRoomDetails();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              stretch: true,
              expandedHeight: screenHeight(context) * 0.3,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    if ((widget.room.imageDTOList ?? []).isEmpty)
                      Image.asset(
                        'assets/images/hotel_image3.jpg',
                        fit: BoxFit.cover,
                      ),
                    if ((widget.room.imageDTOList ?? []).isNotEmpty)
                      CustomNetworkImage(
                        height: screenHeight(context) * 0.3,
                        imagePath:
                            widget.room.imageDTOList?.first.imageUrl ?? '',
                      ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.room.hotelName ?? 'No hotel',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.hotel_class),
                        Text(widget.room.roomType ?? 'No type'),
                      ],
                    ),

                    CustomDivider(spacing: 10),
                    SizedBox(
                      width: screenWidth(context),
                      height: screenHeight(context) * 0.21,
                      child: Column(
                        spacing: 20,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Photos', style: TextStyle(fontSize: 23)),
                              IconButton(
                                onPressed:
                                    (widget.room.imageDTOList == null ||
                                            (widget.room.imageDTOList ?? [])
                                                .isEmpty)
                                        ? null
                                        : () {
                                          context.pushNamed(
                                            Routes.photos,
                                            extra:
                                                widget.room.imageDTOList?.map((
                                                  image,
                                                ) {
                                                  return image.imageUrl ?? '';
                                                }).toList(),
                                          );
                                        },
                                icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                          Expanded(
                            child:
                                (widget.room.imageDTOList ?? []).isEmpty
                                    ? EmptyWidget()
                                    : ListView.builder(
                                      itemCount:
                                          (widget.room.imageDTOList ?? [])
                                              .length,
                                      itemExtent: screenWidth(context) * 0.5,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (_, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0,
                                          ),
                                          child: Container(
                                            height:
                                                screenHeight(context) * 0.05,
                                            decoration: BoxDecoration(
                                              color: ColorPallete.grayColor,
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                  index % 2 == 0
                                                      ? 'assets/images/hotel_image4.jpg'
                                                      : 'assets/images/hotel_image6.jpg',
                                                ),
                                              ),
                                            ),
                                            child:
                                                (widget.room.imageDTOList ?? [])
                                                        .isEmpty
                                                    ? Center()
                                                    : CustomNetworkImage(
                                                      imagePath:
                                                          widget
                                                              .room
                                                              .imageDTOList?[index]
                                                              .imageUrl ??
                                                          '',
                                                    ),
                                          ),
                                        );
                                      },
                                    ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: screenHeight(context) * 0.2),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          fixedSize: Size(
                            screenWidth(context),
                            screenHeight(context) * 0.06,
                          ),
                        ),
                        onPressed: () async {
                          final isBooked = await showModalBottomSheet<bool>(
                            constraints: BoxConstraints(
                              maxHeight: screenHeight(context) * 0.6,
                            ),
                            isScrollControlled: true,
                            useSafeArea: true,
                            context: context,

                            builder: (context) {
                              return _buildModalOverlayContent();
                            },
                          );
                          if (isBooked != null) {
                            if (isBooked) {
                              if (context.mounted) {
                                context.goNamed(Routes.mainRoute);
                              }
                            }
                          }
                        },
                        child: Text('Book'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModalOverlayContent() {
    return BlocProvider(
      create: (context) => _roomInfoCubit,
      child: ReservationOverlayWidget(),
    );
  }

  late final RoomInfoCubit _roomInfoCubit;
}

class ReservationOverlayWidget extends StatefulWidget {
  const ReservationOverlayWidget({super.key});

  @override
  State<ReservationOverlayWidget> createState() =>
      _ReservationOverlayWidgetState();
}

class _ReservationOverlayWidgetState extends State<ReservationOverlayWidget> {
  @override
  void dispose() {
    _rangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            TextFormField(
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Enter number';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.number,
              controller: _numOfPeopleController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(hintText: 'Number of people'),
            ),
            TextFormField(
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Enter Dates';
                } else {
                  return null;
                }
              },
              textAlign: TextAlign.center,
              controller: _rangeController,
              onTap: () async {
                final range = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 40)),
                );
                if (range != null) {
                  dateRange = range;
                  _rangeController.text =
                      '${DateFormat(DateFormat.YEAR_ABBR_MONTH).format(range.start)} -> '
                      '${DateFormat(DateFormat.YEAR_ABBR_MONTH).format(range.end)}';
                }
              },
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Launch and departure dates',
              ),
            ),
            Text(
              'Payment Ratio',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Slider(
                  label: _paymentRatio.toString(),
                  divisions: 8,
                  min: 20,
                  max: 100,
                  value: _paymentRatio,
                  onChanged: (value) {
                    setState(() {
                      _paymentRatio = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('20'), Text('100')],
                ),
              ],
            ),

            Spacer(),

            BlocConsumer<RoomInfoCubit, RoomInfoState>(
              listener: (context, state) {
                if (state.status.isDone) {
                  Fluttertoast.showToast(msg: 'Room booked successfully');
                  context.pop<bool>(true);
                }
              },
              builder: (context, state) {
                return state.status.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : FilledButton(
                      style: FilledButton.styleFrom(
                        fixedSize: Size(
                          screenWidth(context) * 0.65,
                          screenHeight(context) * 0.06,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            dateRange != null) {
                          context.read<RoomInfoCubit>().bookRoom(
                            range: dateRange!,
                            numOfPeople: int.parse(_numOfPeopleController.text),
                            paymentRatio: _paymentRatio.toInt(),
                          );
                        }
                      },
                      child: Text('Confirm'),
                    );
              },
            ),
            SizedBox.square(),
          ],
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  double _paymentRatio = 20;
  final _rangeController = TextEditingController();
  final _numOfPeopleController = TextEditingController();
  DateTimeRange? dateRange;
}
