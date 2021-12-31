//  Import flutter packages.
import 'package:flutter/material.dart';

class NotificationBroadcasterService extends InheritedWidget {
  NotificationBroadcasterService({
    Key? key,
    required this.child,
    required this.notifier,
  }) : super(key: key, child: child);

  final Widget child;

  final ValueNotifier<dynamic> notifier;

  static NotificationBroadcasterService of(BuildContext context) {
    final NotificationBroadcasterService? result = context.dependOnInheritedWidgetOfExactType<NotificationBroadcasterService>();
    assert(result != null, 'No NotificationBroadcasterService found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotificationBroadcasterService old) =>
      notifier != old.notifier;
}

class NotificationBroadcaster extends StatelessWidget {
  NotificationBroadcaster({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  final ValueNotifier<double> notifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return NotificationBroadcasterService(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            notifier.value = notification.metrics.pixels;
            print('NotificationBroadcaster: notifier.value = , '
                '${notifier.value}');
          }
          return false;
        },
        child: child,
      ),
      notifier: notifier,
    );
  }
}

