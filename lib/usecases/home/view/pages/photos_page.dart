import 'package:flutter/material.dart';
import 'package:sky_nest/common/widgets/custom_network_image.dart';
import 'package:sky_nest/usecases/home/view/pages/zoom_image_page.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';
import '../../../../common/utilities/app_utilities.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text('Photos'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
      ),
      body:
          photos.isEmpty
              ? EmptyWidget()
              : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: screenWidth(context) / 2,
                  childAspectRatio: 0.5,
                  crossAxisSpacing: 10,
                  mainAxisExtent: screenHeight(context) * 0.18,
                  mainAxisSpacing: 10,
                ),
                itemCount: photos.length,
                itemBuilder: (_, index) {
                  final image = photos[index];
                  final tag = '$index$image';
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return ZoomImagePage(imageUrl: image, tag: tag);
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: tag,
                      child: CustomNetworkImage(imagePath: image),
                    ),
                  );
                },
              ),
    );
  }

  final List<String> photos;
}
