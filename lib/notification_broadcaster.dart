//  Import flutter packages.
import 'package:flutter/material.dart';


// typedef NotificationBroadcasterCallback<T extends Notification> = bool Function(T notification);

class NotificationBroadcaster<T extends Notification> extends InheritedWidget {

  NotificationBroadcaster({
    Key? key,
    required this.child,
    required this.notificationType,
  })  : listener = NotificationListener<T>(
          child: child,
          onNotification: (notification) {
            // if (notification is notificationType) {
            //   this.notifier.value = notification;
            //   print('NotificationBroadcaster: notification, '
            //       '${notification}');
            // }
            return false;
          },
        ),
        super(key: key, child: child,);

  final Widget child;

  final T notificationType;

  final NotificationListener<T> listener;

  final ValueNotifier<double>? notifier = null;

  static NotificationBroadcaster of(BuildContext context) {
    final NotificationBroadcaster? result =
        context.dependOnInheritedWidgetOfExactType<NotificationBroadcaster>();
    assert(result != null, 'No NotificationBroadcaster found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotificationBroadcaster old)  =>
      notifier != old.notifier;

  bool onNotification(T notification) {
  // bool onNotification(T notification, T notificationType) {
    return true;
  }
}

// class SNotificationBroadcaster<ScrollNotification>
//     extends NotificationBroadcaster {
//   SNotificationBroadcaster({
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child,);
//
//   static SNotificationBroadcaster of(BuildContext context) {
//     final SNotificationBroadcaster? result =
//     context.dependOnInheritedWidgetOfExactType<SNotificationBroadcaster>();
//     assert(result != null, 'No SNotificationBroadcaster found in context');
//     return result!;
//   }
//
//   @override
//   bool updateShouldNotify(SNotificationBroadcaster old) =>
//       notifier != old.notifier;
//
//   @override
//   bool overridesOnNotification(ScrollNotification notification) {
//     return true;
//   }
//
// }