//  Import flutter packages.
import 'package:flutter/material.dart';

mixin NotificationBroadcasterServiceListener<T extends Notification> on NotificationBroadcasterService {}

abstract class NotificationBroadcasterService<T extends Notification> extends InheritedWidget {
  const NotificationBroadcasterService({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static NotificationBroadcasterService of(BuildContext context) {
    final NotificationBroadcasterService? result = context.dependOnInheritedWidgetOfExactType<NotificationBroadcasterService>();
    assert(result != null, 'No NotificationBroadcasterService found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotificationBroadcasterService old) =>
      notifyOnChange();

  /// notifyOnChange is an abstract method which must be overridden by the
  /// mixin that specialises [NotificationBroadcasterService].
  bool notifyOnChange();
}

/// [NotificationBroadcaster] can be placed anywhere in the widget tree
/// provided it is above the relevant notifier.
abstract class NotificationBroadcaster<T extends Notification> extends StatelessWidget {
  const NotificationBroadcaster({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// [child] is the immediate descendant, not necessarily the widget that
  /// dispatches the notifications.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return this.child;
  }
}
