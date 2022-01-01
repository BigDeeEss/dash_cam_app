//  Import flutter packages.
import 'package:flutter/material.dart';

/// [_NotificationBroadcasterService] catches and rebroadcasts notifications
/// proceeding up the widget tree.
///
/// Widgets anywhere below [_NotificationBroadcasterService] access the
/// associated notification data by interrogating notifier.
class _NotificationBroadcasterService extends InheritedWidget {
  _NotificationBroadcasterService({
    Key? key,
    required this.child,
    required this.notifier,
  }) : super(key: key, child: child);

  /// [child] is the immediate descendant of [_NotificationBroadcasterService].
  final Widget child;

  /// [notifier] stores the required notification data value, defined in
  /// the callback associated with the instance of [NotificationBroadcaster],
  /// which is accessible to all widgets below it in the widget tree.
  final ValueNotifier<double> notifier;

  /// Allow [_NotificationBroadcasterService] to broadcast updates whenever
  /// notifier changes.
  @override
  bool updateShouldNotify(_NotificationBroadcasterService old) =>
      notifier != old.notifier;
}

/// [NotificationBroadcaster] combines the services associated with the
/// NotificationListener and [_NotificationBroadcasterService] classes into
/// a single class that provides both services.
class NotificationBroadcaster<T extends Notification,
    U extends ScrollNotification> extends StatelessWidget {
  NotificationBroadcaster({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// [child] is the immediate descendant of [NotificationBroadcaster].
  final Widget child;

  /// [notifier] is passed to [_NotificationBroadcasterService] which then
  /// makes it available to all widgets below [NotificationBroadcaster] in the
  /// widget tree.
  final ValueNotifier<double> notifier = ValueNotifier(0.0);

  /// [listener] listens out for notifications of type T. On condition
  /// of onNotification callback defined below, it updates [notifier].
  late NotificationListener<T> listener;

  /// [broadcaster] provides the rebroadcasting service for widgets
  /// below it in the widget tree,
  late _NotificationBroadcasterService broadcaster;

  /// Allow widgets below [NotificationBroadcaster] in the widget tree to
  /// access the data stored in notifier via [_NotificationBroadcasterService].
  static _NotificationBroadcasterService of(BuildContext context) {
    final _NotificationBroadcasterService? result = context
        .dependOnInheritedWidgetOfExactType<_NotificationBroadcasterService>();
    assert(
    result != null, 'No _NotificationBroadcasterService found in context');
    return result!;
  }

  @override
  Widget build(BuildContext context) {
    listener = NotificationListener<T>(
      onNotification: (notification) {
        if (notification is U) {
          notifier.value = notification.metrics.pixels;
          print('NotificationBroadcaster: notifier.value, '
              '${notifier.value}');
        }
        return false;
      },
      child: child,
    );

    broadcaster = _NotificationBroadcasterService(
      child: listener,
      notifier: notifier,
    );

    return broadcaster;
  }
}
