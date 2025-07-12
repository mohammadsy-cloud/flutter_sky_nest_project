import 'package:flutter/material.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';

class ZoomImagePage extends StatelessWidget {
  const ZoomImagePage({super.key, required this.imageUrl, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      backgroundColor: Colors.transparent,
      body: Center(
        child: Hero(
          tag: tag,
          child: SizedBox(
            height: screenHeight(context) * 0.4,
            child: CustomNetworkImage(imagePath: imageUrl),
          ),
        ),
      ),
    );
  }

  final String imageUrl;
  final String tag;
}
