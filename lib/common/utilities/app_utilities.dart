import 'package:flutter/widgets.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
bool validateFormKey(GlobalKey<FormState> key) => key.currentState!.validate();
