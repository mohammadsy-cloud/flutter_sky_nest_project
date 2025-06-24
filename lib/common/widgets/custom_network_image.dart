import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/services/api_service/api_urls.dart';
import 'package:sky_nest/common/utilities/app_utilities.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imagePath, this.height});
  final String imagePath;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      httpHeaders: {
        'Authorization':
            'Bearer ${context.read<AuthenticationBloc>().state.token}',
      },
      errorWidget: (context, url, error) {
        return Container(
          height: height ?? screenHeight(context) * 0.13,
          color: Theme.of(context).colorScheme.primary,
        );
      },
      placeholder: (context, url) {
        return Container(
          height: screenHeight(context) * 0.13,
          color: Theme.of(context).colorScheme.primary,
        );
      },
      imageUrl: '${ApiUrls.apiServerUrl}/$imagePath',
      height: height ?? screenHeight(context) * 0.13,
      fit: BoxFit.cover,
    );
  }
}
