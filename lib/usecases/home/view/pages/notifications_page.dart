import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sky_nest/usecases/home/view/widgets/empty_widget.dart';

import '../../../../common/utilities/app_utilities.dart';
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
        listener: (context, state) {},
        builder: (context, state) {
          if (state.notifications.isEmpty) {
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
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  }
                  final notification = state.notifications[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(12),
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

  final _notificationsCubit = NotificationsCubit();
}
