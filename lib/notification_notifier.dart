//  Import flutter packages.
import 'package:flutter/material.dart';

/// [_NotificationNotifierService] notifies listenable objects below
/// it in the widget tree of changes to [notificationData].
class _NotificationNotifierService extends InheritedWidget {
  _NotificationNotifierService({
    Key? key,
    required this.child,
    required this.notificationData,
  }) : super(key: key, child: child);

  /// [child] is the immediate descendant of [_NotificationNotifierService].
  final Widget child;

  /// [notificationData] stores notification data.
  ///
  /// The value stored in [notificationData] is defined by the callback
  /// associated with the instance of [NotificationNotifier].
  final ValueNotifier<double> notificationData;

  /// Allow [_NotificationNotifierService] to notify listenable objects
  /// of updates to [notificationData].
  @override
  bool updateShouldNotify(_NotificationNotifierService old) =>
      notificationData != old.notificationData;
}

/// [NotificationNotifier] combines instances of NotificationListener
/// and [_NotificationNotifierService].
///
/// [NotificationNotifier] catches and stores notifications propagating
/// up the widget tree, stores the data in [notificationData], and notifies
/// listenable objects below it in the widget tree of updates via the
/// [_NotificationNotifierService] class.
///
/// [NotificationNotifier] makes [notificationData] available to listenable
/// objects below it in the widget tree via the [of] method defined below.
class NotificationNotifier<T extends Notification,
    U extends ScrollNotification> extends StatelessWidget {
  NotificationNotifier({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// [child] is the immediate descendant of [NotificationNotifier].
  final Widget child;

  /// [notificationData] is passed to [_NotificationNotifierService] which
  /// can notify listenable objects below it in the widget tree
  /// of updates (to [notificationData]).
  ///
  /// The [of] method bound to [NotificationNotifier] makes [notificationData]
  /// available to listenable objects below it in the widget tree.
  final ValueNotifier<double> notificationData = ValueNotifier(0.0);

  /// [listener] listens out for notifications of type T. On condition of
  /// onNotification callback defined below, defined in terms of type U,
  /// it updates [notificationData].
  late NotificationListener<T> listener;

  /// [notificationNotifier] notifies listenable objects below it in the
  /// widget tree of updates to [notificationData].
  late _NotificationNotifierService notificationNotifier;

  /// Allow widgets below [NotificationNotifier] in the widget tree to access
  /// the data stored in [notificationData] via the [notificationNotifier]
  /// instance of [_NotificationNotifierService].
  static _NotificationNotifierService of(BuildContext context) {
    final _NotificationNotifierService? result = context
        .dependOnInheritedWidgetOfExactType<_NotificationNotifierService>();
    assert(
    result != null, 'No _NotificationNotifierService found in context');
    return result!;
  }

  @override
  Widget build(BuildContext context) {
    listener = NotificationListener<T>(
      onNotification: (notification) {
        if (notification is U) {
          notificationData.value = notification.metrics.pixels;
        }
        return false;
      },
      child: child,
    );

    notificationNotifier = _NotificationNotifierService(
      child: listener,
      notificationData: notificationData,
    );

    return notificationNotifier;
  }
}
