import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/blurred_dialog.dart';
import 'package:sky_nest/common/widgets/counter_widget.dart';
import 'package:sky_nest/common/widgets/custom_divider.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/repo/user_hotel/user_hotel_repo.dart';
import 'package:sky_nest/usecases/home/view/widgets/custom_date_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../../../common/navigation/routes.dart';
import '../../model/hotel.dart';
import '../../viewmodel/hotel_info_cubit/hotel_info_cubit.dart';

class HotelInfoPage extends StatefulWidget {
  const HotelInfoPage({super.key, required this.hotel});
  final Hotel hotel;

  @override
  State<HotelInfoPage> createState() => _HotelInfoPageState();
}

class _HotelInfoPageState extends State<HotelInfoPage> {
  @override
  void initState() {
    super.initState();
    _hotelInfoCubit = HotelInfoCubit(
      userHotelRepo: UserHotelRepo(),
      hotel: widget.hotel,
    );
    _hotelInfoCubit.showHotelPlacesImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _hotelInfoCubit.showHotelDetails();
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
                    if ((widget.hotel.imageDTOList ?? []).isEmpty)
                      Image.asset(
                        'assets/images/hotel_image3.jpg',
                        fit: BoxFit.cover,
                      ),
                    if ((widget.hotel.imageDTOList ?? []).isNotEmpty)
                      CustomNetworkImage(
                        height: screenHeight(context) * 0.3,
                        imagePath:
                            widget.hotel.imageDTOList?.first.imageUrl ?? '',
                      ),
                    Positioned(
                      top: 35,
                      right: 10,
                      child: IconButton(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        style: IconButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer,
                        ),
                        tooltip: 'Rate',
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder:
                                (_) => BlurredDialog(child: _buildRateDialog()),
                          );
                        },
                        icon: Icon(Icons.star),
                      ),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RatingBar(
                          ignoreGestures: true,
                          itemSize: 25,
                          updateOnDrag: false,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.amber),
                            half: Icon(
                              Icons.star_half_outlined,
                              color: Colors.amber,
                            ),
                            empty: Icon(Icons.star_border, color: Colors.amber),
                          ),
                          glowColor: Colors.amber,
                          initialRating: widget.hotel.avgRating ?? 0.0,

                          onRatingUpdate: (value) {},
                        ),
                        Text('${widget.hotel.avgRating ?? 0.0}'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.hotel.name ?? 'No hotel',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.location_on_sharp),
                        Text(widget.hotel.address ?? 'No address'),
                      ],
                    ),
                    CustomDivider(spacing: 10),
                    Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      widget.hotel.description ??
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
                              ' sed do eiusmod tempor incididunt ut labore et dolore magna'
                              ' aliqua. Ut enim ad minim veniam, quis nostrud exercitation .',
                      style: TextStyle(fontSize: 12),
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
                                onPressed: () {
                                  context.pushNamed(
                                    Routes.photos,
                                    extra:
                                        widget.hotel.imageDTOList?.map((image) {
                                          return image.imageUrl ?? '';
                                        }).toList(),
                                  );
                                },
                                icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount:
                                  (widget.hotel.imageDTOList ?? []).length,
                              itemExtent: screenWidth(context) * 0.5,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5.0,
                                  ),
                                  child: Container(
                                    height: screenHeight(context) * 0.05,
                                    decoration: BoxDecoration(
                                      color: ColorPallete.grayColor,
                                      borderRadius: BorderRadius.circular(11),
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
                                        (widget.hotel.imageDTOList ?? [])
                                                .isEmpty
                                            ? Center()
                                            : CustomNetworkImage(
                                              imagePath:
                                                  widget
                                                      .hotel
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

                    CustomDivider(spacing: 20),
                    SizedBox(
                      width: screenWidth(context),
                      height: screenHeight(context) * 0.21,
                      child: Column(
                        spacing: 20,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nearby Places',
                                style: TextStyle(fontSize: 23),
                              ),
                              IconButton(
                                onPressed: () {
                                  context.pushNamed(
                                    Routes.hotelPlaces,
                                    extra: widget.hotel,
                                  );
                                },
                                icon: Icon(Icons.arrow_forward_ios),
                              ),
                            ],
                          ),
                          Expanded(
                            child: BlocConsumer<HotelInfoCubit, HotelInfoState>(
                              listener: (_, state) {
                                if (state.status.isLoading) {
                                  LoadingIndicator().show(context);
                                } else {
                                  LoadingIndicator().hideAll();
                                  if (state.status.isError) {
                                    Fluttertoast.showToast(
                                      msg: state.statusMessage,
                                    );
                                  }
                                }
                              },
                              bloc: _hotelInfoCubit,
                              builder: (context, state) {
                                if (state.nearbyPlacesPhotos.isEmpty) {
                                  return EmptyWidget();
                                }
                                return Skeletonizer(
                                  enabled:
                                      state.nearbyPlacesPhotosStatus.isLoading,
                                  child: ListView.builder(
                                    itemCount:
                                        state.nearbyPlacesPhotosStatus.isLoading
                                            ? 3
                                            : state.nearbyPlacesPhotos.length,
                                    itemExtent: screenWidth(context) * 0.5,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        child: Container(
                                          height: screenHeight(context) * 0.05,
                                          decoration: BoxDecoration(
                                            color: ColorPallete.grayColor,
                                            borderRadius: BorderRadius.circular(
                                              11,
                                            ),
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
                                              state
                                                      .nearbyPlacesPhotosStatus
                                                      .isLoading
                                                  ? Center()
                                                  : CustomNetworkImage(
                                                    imagePath:
                                                        state
                                                            .nearbyPlacesPhotos[index],
                                                  ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    CustomDivider(spacing: 20),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          fixedSize: Size(
                            screenWidth(context) * 0.4,
                            screenHeight(context) * 0.06,
                          ),
                        ),
                        onPressed: () {
                          context.pushNamed(
                            Routes.hotelRooms,
                            extra: widget.hotel,
                          );
                        },
                        child: Text('View Rooms'),
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

  AlertDialog _buildRateDialog() {
    double currentRate = 0.0;
    return AlertDialog(
      content: Container(
        height: screenHeight(context) * 0.4,
        width: screenWidth(context) * 0.9,
        padding: EdgeInsets.all(5),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Give this Hotel a rate',
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(
              width: screenWidth(context) * 0.3,
              height: screenHeight(context) * 0.05,
              child: FittedBox(
                child: RatingBar(
                  ratingWidget: RatingWidget(
                    full: Icon(Icons.star),
                    half: Icon(Icons.star_half),
                    empty: Icon(Icons.star_outline),
                  ),
                  onRatingUpdate: (value) {
                    currentRate = value;
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text('Comment', style: TextStyle(fontSize: 13)),
            ),

            TextField(
              controller: _commentController,
              textInputAction: TextInputAction.done,
              maxLines: 3,
              maxLength: 100,
              textAlignVertical: TextAlignVertical.top,
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),
            ),
            SizedBox(height: 10),
            BlocListener<HotelInfoCubit, HotelInfoState>(
              bloc: _hotelInfoCubit,
              listener: (context, state) {
                if (state.status.isError) {
                  Fluttertoast.showToast(msg: state.statusMessage);
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    screenWidth(context),
                    screenHeight(context) * 0.03,
                  ),
                ),
                onPressed: () {
                  if (_commentController.text.trim().isNotEmpty &&
                      currentRate != 0.0) {
                    _hotelInfoCubit.rateHotel(
                      currentRate,
                      _commentController.text,
                    );
                  }
                },
                child: Text('Review'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildModalOverlayContent(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context) * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Container(
              width: 80,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: screenHeight(context) * 0.4,
              width: screenWidth(context) * 0.9,
              child: CustomDateTable(
                onSelectDate: (selectedDate) {
                  _selectedDay = selectedDate;
                },
              ),
            ),
            SizedBox(height: 10),
            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(
                  screenWidth(context) * 0.65,
                  screenHeight(context) * 0.06,
                ),
              ),
              onPressed: () {
                context.pop();
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return _buildRoomsOverlay(context);
                  },
                );
              },
              child: Text('Select rooms'),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildRoomsOverlay(BuildContext context) {
    return Container(
      width: screenWidth(context),
      height: screenHeight(context) * 0.27,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Container(
                width: 80,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Select the number of rooms',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rooms',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  CounterWidget(),
                ],
              ),
              SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  context.pop();

                  context.pushNamed(
                    Routes.confirmReservationRoute,
                    pathParameters: {
                      'hotelName': widget.hotel.name ?? 'No hotel',
                    },
                  );
                },
                child: Text('Confirm booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime _selectedDay = DateTime.now();
  final _commentController = TextEditingController();
  late final HotelInfoCubit _hotelInfoCubit;
}
