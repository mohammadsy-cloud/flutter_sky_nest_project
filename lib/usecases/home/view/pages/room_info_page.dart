import 'package:flutter/material.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';

import '../../model/room.dart';

class RoomInfoPage extends StatefulWidget {
  const RoomInfoPage({super.key, required this.room});
  final Room room;
  @override
  State<RoomInfoPage> createState() => _RoomInfoPageState();
}

class _RoomInfoPageState extends State<RoomInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.room.hotelName ?? 'No hotel name'),
            toolbarHeight: screenHeight(context) * 0.12,
            automaticallyImplyLeading: false,
          ),
        ],
      ),
    );
  }
}
