import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../../../common/theme/color_pallete.dart';
import '../../../../common/utilities/app_utilities.dart';
import '../../../../common/widgets/blurred_dialog.dart';
import '../../model/notification_model.dart';
import '../../viewmodel/notifications_cubit/notifications_cubit.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
    _notificationsCubit.fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        toolbarHeight: screenHeight(context) * 0.1,
        title: Text('Notifications'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w600,
          fontSize: 23,
        ),
      ),
      body: BlocConsumer<NotificationsCubit, NotificationsState>(
        bloc: _notificationsCubit,
        listener: (context, state) {
          if (state.status.isError) {
            Fluttertoast.showToast(msg: state.statusMessage);
          }
        },
        builder: (context, state) {
          if (!state.status.isLoading && state.notifications.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                _notificationsCubit.fetchNotifications();
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight(context) * 0.3),
                    EmptyWidget(),
                  ],
                ),
              ),
            );
          }
          return Skeletonizer(
            enabled: state.status.isLoading,
            child: RefreshIndicator(
              onRefresh: () async {
                _notificationsCubit.fetchNotifications();
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount:
                    state.status.isLoading ? 10 : state.notifications.length,
                itemExtent: screenHeight(context) * 0.1,
                itemBuilder: (_, index) {
                  if (state.status.isLoading) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: ColorPallete.grayColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  }
                  final n = state.notifications[index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return _buildDialog(
                              msg: n.notificationDetails ?? '',
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: ColorPallete.grayColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          spacing: 10,
                          children: [
                            CircleAvatar(child: Text('${n.id ?? -1}')),
                            SizedBox(
                              width: screenWidth(context) * 0.7,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                n.notificationDetails ?? 'no notification',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDialog({String msg = 'no message'}) {
    return BlurredDialog(
      child: AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: screenWidth(context) * 0.5,
              child: FittedBox(
                child: Text(
                  textAlign: TextAlign.center,
                  'Notification details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              msg,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  final _notificationsCubit = NotificationsCubit();
}
