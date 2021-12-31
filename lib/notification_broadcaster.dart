//  Import flutter packages.
import 'package:flutter/material.dart';

/// [NotificationBroadcasterService] catches notifications proceeding up
/// the widget tree and then allows widgets anywhere below it to
/// access the associated notification data by interrogating notifier.
class NotificationBroadcasterService extends InheritedWidget {
  NotificationBroadcasterService({
    Key? key,
    required this.child,
    required this.notifier,
  }) : super(key: key, child: child);

  /// [child] is the immediate descendant of [NotificationBroadcasterService].
  final Widget child;

  /// [notifier] stores the required notification data value, defined in
  /// the callback associated with the instance of [NotificationBroadcaster],
  /// which is accessible to all widgets below it in the widget tree.
  final ValueNotifier<double> notifier;

  //  Allow widgets below [NotificationBroadcasterService] in the widget tree
  //  to access the data stored in notifier.
  static NotificationBroadcasterService of(BuildContext context) {
    final NotificationBroadcasterService? result = context.dependOnInheritedWidgetOfExactType<NotificationBroadcasterService>();
    assert(result != null, 'No NotificationBroadcasterService found in context');
    return result!;
  }

  //  Allow [NotificationBroadcasterService] to broadcast updates whenever
  //  notifier changes.
  @override
  bool updateShouldNotify(NotificationBroadcasterService old) =>
      notifier != old.notifier;
}


/// [NotificationBroadcaster] combines the services associated with
/// NotificationListener and [NotificationBroadcasterService] classes into
/// a single class that provides both services.
class NotificationBroadcaster<T extends Notification, U extends ScrollNotification> extends StatelessWidget {
  NotificationBroadcaster({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// [child] is the immediate descendant of [NotificationBroadcaster].
  final Widget child;

  /// [notifier] is passed to [NotificationBroadcasterService] and made
  /// available to all widgets below [NotificationBroadcaster] in the
  /// widget tree.
  final ValueNotifier<double> notifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return NotificationBroadcasterService(
      child: NotificationListener<T>(
        onNotification: (notification) {
          if (notification is U) {
            notifier.value = notification.metrics.pixels;
            print('NotificationBroadcaster: notifier.value, '
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

