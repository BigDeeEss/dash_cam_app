//  Import flutter packages.
import 'package:flutter/material.dart';

class NotificationBroadcasterService<T extends Notification, U extends ScrollNotification> extends InheritedWidget {

  NotificationBroadcasterService({
    Key? key,
    required this.child,
    required this.notifier,
    required this.listener,
  })  : super(key: key, child: child,);
        // listener = NotificationListener<T>(
        //   child: child,
        //   onNotification: (notification) {
        //     if (notification is U) {
        //       notifier.value = notification.metrics.pixels;
        //     }
        //     return false;
        //   }
        // ),
        // super(key: key, child: child,);

  final Widget child;

  final NotificationListener<T> listener;

  final ValueNotifier<double> notifier;

  static NotificationBroadcasterService of(BuildContext context) {
    final NotificationBroadcasterService? result =
    context.dependOnInheritedWidgetOfExactType<NotificationBroadcasterService>();
    assert(result != null, 'No NotificationBroadcasterService found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotificationBroadcasterService old) =>
      notifier != old.notifier;
}

class NotificationBroadcaster<T extends Notification, U extends ScrollNotification> extends StatelessWidget {
  NotificationBroadcaster({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  final ValueNotifier<double> notifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    print('Building NotificationBroadcaster...');
    return NotificationBroadcasterService<T, U>(
      child: child,
      notifier: notifier,
      listener: NotificationListener<T>(
        child: child,
        onNotification: (notification) {
          if (notification is U) {
            notifier.value = notification.metrics.pixels;
          }
          return false;
        }
      ),
    );
  }
}
