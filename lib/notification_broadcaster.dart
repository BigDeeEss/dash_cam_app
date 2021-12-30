//  Import flutter packages.
import 'package:flutter/material.dart';

class NotificationBroadcaster<T extends Notification> extends InheritedWidget {

  NotificationBroadcaster({
    Key? key,
    required this.child,
    required this.notifier,
  })  : listener = NotificationListener<T>(
          child: child,
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              notifier.value = notification.metrics.pixels;
            }
            return false;
          }
        ),
        super(key: key, child: child,);

  final Widget child;

  final NotificationListener<T> listener;

  final ValueNotifier<double> notifier;

  static NotificationBroadcaster of(BuildContext context) {
    final NotificationBroadcaster? result =
    context.dependOnInheritedWidgetOfExactType<NotificationBroadcaster>();
    assert(result != null, 'No NotificationBroadcaster found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotificationBroadcaster old) =>
      notifier != old.notifier;
}

class ScrollNotificationBroadcaster
    extends NotificationBroadcaster<ScrollNotification> {
}