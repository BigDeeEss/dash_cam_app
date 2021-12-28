//  Import flutter packages.
import 'package:flutter/material.dart';

/// [NotificationBroadcaster] catches notifications proceeding up
/// the widget tree and then allows widgets anywhere below it to
/// access the associated notification data.
class NotificationBroadcaster extends InheritedWidget {
  const NotificationBroadcaster({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static NotificationBroadcaster of(BuildContext context) {
    final NotificationBroadcaster? result = context.dependOnInheritedWidgetOfExactType<NotificationBroadcaster>();
    assert(result != null, 'No NotificationBroadcaster found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotificationBroadcaster old) {
    return true;
  }
}
