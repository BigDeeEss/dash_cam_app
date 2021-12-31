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
  const NotificationBroadcaster({
    Key? key,
    required this.child,
    required this.notifier,
  }) : super(key: key);

  final Widget child;

  final ValueNotifier<dynamic> notifier;

  @override
  Widget build(BuildContext context) {
    return NotificationBroadcasterService(
      child: child,
      notifier: notifier,
    );
  }
}

