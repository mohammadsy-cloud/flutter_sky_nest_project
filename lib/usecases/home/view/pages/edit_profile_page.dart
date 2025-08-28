import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/theme/color_pallete.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:sky_nest/usecases/home/repo/profile/requests/edit_profile_request.dart';
import 'package:sky_nest/usecases/home/viewmodel/profile_bloc/profile_bloc.dart';

import '../../../../common/utilities/app_utilities.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lat = context.read<ProfileBloc>().state.user?.longitude;
      final long = context.read<ProfileBloc>().state.user?.latitude;
      _initialLocation = LatLng(lat ?? 35.00, long ?? 35.00);
      _fetchAdress();
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    LoadingIndicator().hideAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        actions: [],
        title: Text('Edit profile'),
        toolbarHeight: screenHeight(context) * 0.08,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 80,
          bottom: MediaQuery.of(context).viewInsets.bottom * 0.3,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text('Full name', style: TextStyle(fontSize: 17)),
            TextFormField(
              controller: _fullNameController,
              decoration: InputDecoration(
                hintText:
                    context.read<ProfileBloc>().state.user?.fullName ??
                    'No User',
              ),
            ),
            Text('My Address', style: TextStyle(fontSize: 17)),
            Container(
              width: screenWidth(context),
              height: screenHeight(context) * 0.18,
              decoration: BoxDecoration(
                color: ColorPallete.grayColor,
                borderRadius: BorderRadius.circular(13),
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: getMapSnapshot(
                      _choosenLocation ??
                          _initialLocation ??
                          LatLng(35.0, 35.0),
                    ),
                    errorWidget:
                        (context, url, error) => Container(
                          width: screenWidth(context),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                    fit: BoxFit.cover,
                    width: screenWidth(context),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: screenWidth(context),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.0, -0.5),
                            blurRadius: 1.5,
                            spreadRadius: 2.5,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withAlpha(100),
                          ),
                        ],
                      ),
                      alignment: AlignmentDirectional(-0.9, 0.0),
                      child: Text(
                        textAlign: TextAlign.start,
                        _currentAddress ?? '',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                fixedSize: Size(
                  screenWidth(context),
                  screenHeight(context) * 0.05,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: Icon(Icons.map),
              onPressed: () async {
                final newLocation = await context.pushNamed<LatLng>(
                  Routes.chooseLocationRoute,
                  pathParameters: {
                    'lat':
                        (_choosenLocation ?? _initialLocation)!.latitude
                            .toString(),
                    'long':
                        (_choosenLocation ?? _initialLocation)!.longitude
                            .toString(),
                  },
                );
                if (newLocation != null) {
                  setState(() {
                    _choosenLocation = newLocation;
                  });
                  _fetchAdress();
                }
              },
              label: Text('Choose on map'),
            ),

            SizedBox(height: screenHeight(context) * 0.07),
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state.status.isLoading) {
                  LoadingIndicator().show(context);
                } else {
                  LoadingIndicator().hideAll();
                  Fluttertoast.showToast(msg: state.statusMessage);
                  if (state.status.isDone) {
                    context.read<ProfileBloc>().add(ProfileFetched());
                    context.pop();
                  }
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      screenWidth(context),
                      screenHeight(context) * 0.08,
                    ),
                  ),
                  onPressed:
                      (_checkNullability() || state.status.isLoading)
                          ? null
                          : () {
                            context.read<ProfileBloc>().add(
                              ProfileModified(
                                request: EditProfileRequest(
                                  fullName:
                                      _fullNameController.text.trim().isEmpty
                                          ? null
                                          : _fullNameController.text,
                                  latitude: _choosenLocation?.latitude,

                                  longitude: _choosenLocation?.longitude,
                                ),
                              ),
                            );
                          },
                  child: Text('Submit', style: TextStyle(fontSize: 20)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  _fetchAdress() async {
    if (_choosenLocation != null) {
      final address = await getAddressFromLatLng(
        _choosenLocation!.longitude,
        _choosenLocation!.latitude,
      );
      setState(() {
        _currentAddress = address;
      });
    } else {
      if (_initialLocation != null) {
        final address = await getAddressFromLatLng(
          _initialLocation!.latitude,
          _initialLocation!.longitude,
        );
        setState(() {
          _currentAddress = address;
        });
      }
    }
  }

  bool _checkNullability() {
    return _choosenLocation == null && _fullNameController.text.trim().isEmpty;
  }

  LatLng? _choosenLocation;
  LatLng? _initialLocation;
  String? _currentAddress;
  final _fullNameController = TextEditingController();
}
