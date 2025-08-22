import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:sky_nest/common/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:sky_nest/common/navigation/routes.dart';
import 'package:sky_nest/common/repos/authentication/requests/register_request.dart';
import 'package:sky_nest/common/widgets/loading_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/color_pallete.dart';
import '../../../../common/utilities/app_utilities.dart';
import 'package:sky_nest/common/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _locationController = TextEditingController();
  late AuthenticationBloc _authenticationBloc;
  String _currentAddress = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authenticationBloc = context.read<AuthenticationBloc>();
    _fetchUserAddress();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = context.read<AuthenticationBloc>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: screenHeight(context) * 0.08,
            bottom: MediaQuery.of(context).viewInsets.bottom * 0.3,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(-30.0, 0.0),
                  child: Image.asset(
                    color: Theme.of(context).colorScheme.primary,
                    'assets/images/app_logo_skynest.png',
                    width: screenWidth(context) * 0.7,
                    height: screenHeight(context) * 0.08,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Register Now!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter Your information below',
                  style: TextStyle(fontSize: 17, color: ColorPallete.grayColor),
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  validator: (value) {
                    if (checkIfEmpty(value)) {
                      return 'Enter a valid name';
                    } else {
                      return null;
                    }
                  },
                  label: 'Full Name',
                  controller: _fullNameController,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  validator: (value) {
                    if (!isValidEmail(value)) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  label: 'Email',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  validator: (value) {
                    if (checkIfEmpty(value)) {
                      return 'Enter a valid password';
                    } else {
                      return null;
                    }
                  },
                  obsecureText: true,
                  label: 'Password',
                  controller: _passwordController,
                ),
                SizedBox(height: 20),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state.user?.latitude == null) {
                      _fetchUserAddress();
                    }
                    return CustomTextFormField(
                      key: ValueKey(_currentAddress),
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (checkIfEmpty(value) &&
                            state.user?.latitude == null) {
                          return 'Enter a valid location';
                        } else {
                          return null;
                        }
                      },
                      readOnly: true,
                      suffixIcon: Icon(Icons.location_on_outlined),
                      label: 'Choose on map',
                      controller: _locationController..text = _currentAddress,
                      onTap: () async {
                        final newLocation = await context.pushNamed<LatLng>(
                          Routes.chooseLocationRoute,
                          pathParameters: {
                            'lat': '${state.user?.latitude ?? 33.47469}',
                            'long': '${state.user?.latitude ?? 36.290594}',
                          },
                        );
                        if (newLocation != null) {
                          setState(() {
                            _currentAddress = 'Address selected';
                          });
                          var addr =
                              await getAddressFromLatLng(
                                newLocation.longitude,
                                newLocation.latitude,
                              ) ??
                              'Address selected';
                          setState(() {
                            _currentAddress = addr;
                          });
                          _authenticationBloc.add(
                            AuthAddLocation(
                              lat: newLocation.latitude,
                              long: newLocation.longitude,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: screenWidth(context),
                  height: screenHeight(context) * 0.08,
                  child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    listenWhen:
                        (previous, current) => !current.dataState.isEmpty,
                    listener: (context, state) {
                      if (state.dataState.isLoading) {
                        LoadingIndicator().show(context);
                      } else {
                        LoadingIndicator().hideAll();
                        if (state.dataState.isError) {
                          Fluttertoast.showToast(msg: state.message);
                        }
                        if (state.dataState.isData) {
                          context.pushNamed(
                            Routes.verificationCodeRoute,
                            pathParameters: {
                              "code": "1",
                              "email": _emailController.text,
                            },
                          );
                        }
                      }
                    },
                    builder: (context, state) {
                      return FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              state.user != null) {
                            context.read<AuthenticationBloc>().add(
                              AuthSignUp(
                                request: RegisterRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  fullName: _fullNameController.text,
                                  longitude: state.user!.longitude!,
                                  latitude: state.user!.latitude!,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text('Register', style: TextStyle(fontSize: 18)),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'Already a member? ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      children: [
                        TextSpan(
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap =
                                    () => context.goNamed(Routes.loginRoute),
                          text: 'Login',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _fetchUserAddress() async {
    if (_authenticationBloc.state.user?.latitude == null) {
      return;
    } else {
      final addreess = await getAddressFromLatLng(
        _authenticationBloc.state.user!.longitude!,
        _authenticationBloc.state.user!.latitude!,
      );
      if (addreess != null && addreess.trim().isNotEmpty) {
        _currentAddress = addreess;
      } else {
        _currentAddress = 'Location fetched';
      }
      _locationController.text = _currentAddress;
    }
  }
}
