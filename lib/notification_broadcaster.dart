//  Import flutter packages.
import 'package:flutter/material.dart';

class NotificationBroadcaster<T extends Notification> extends InheritedWidget {

  NotificationBroadcaster({
    Key? key,
    required this.child,
  })
      : listener = NotificationListener<T>(
    child: child,
    onNotification: (notification) {
      return false;
    },
  ),
        super(key: key, child: child,);

  final Widget child;

  final NotificationListener<T> listener;

  final ValueNotifier<double> notifier = ValueNotifier(0.0);

  // static NotificationBroadcaster of(BuildContext context) {
  //   final NotificationBroadcaster? result =
  //       context.dependOnInheritedWidgetOfExactType<NotificationBroadcaster>();
  //   assert(result != null, 'No NotificationBroadcaster found in context');
  //   return result!;
  // }

  @override
  bool updateShouldNotify(NotificationBroadcaster old) {
    return true;
  }
}

class SNotificationBroadcaster<ScrollNotification>
    extends NotificationBroadcaster {
  SNotificationBroadcaster({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child,);

  static SNotificationBroadcaster of(BuildContext context) {
    final SNotificationBroadcaster? result =
    context.dependOnInheritedWidgetOfExactType<SNotificationBroadcaster>();
    assert(result != null, 'No SNotificationBroadcaster found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SNotificationBroadcaster old) =>
      notifier != old.notifier;
}