import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';
import 'package:flutter/material.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title1,
    required this.title2,
    this.title3,
    this.onTap,
  });
  final String imagePath;
  final String title1;
  final String title2;
  final String? title3;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              ColorPallete.grayColor1,
              ColorPallete.grayColor1.withAlpha(200),
            ],
          ),
          color: ColorPallete.grayColor1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(imagePath: imagePath),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 20,
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                overflow: TextOverflow.ellipsis,
                title2,
                style: TextStyle(
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
            ),
            if (title3 != null) ...[
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  title3!,
                  style: TextStyle(fontSize: 15, color: Colors.green[400]),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
