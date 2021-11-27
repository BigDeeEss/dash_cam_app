//  Import flutter packages.
import 'package:flutter/material.dart';

class NotificationBroadcasterEngine extends InheritedWidget {
  /// Implements a method for descendant widgets to access notifications.
  const NotificationBroadcasterEngine({
    Key? key,
    required this.notifier,
    required this.child,
  }) : super(key: key, child: child);

  /// [notifier], the service provided by this widget, is the method by
  /// which descendant widgets are able to access notifications that
  /// bubble up the widget tree.
  final ValueNotifier<dynamic> notifier;

  /// [child] is this widget's immediate descendant.
  final Widget child;

  static NotificationBroadcasterEngine of(BuildContext context) {
    final NotificationBroadcasterEngine? result =
        context.dependOnInheritedWidgetOfExactType<NotificationBroadcasterEngine>();
    assert(result != null, 'No NotificationBroadcasterEngine found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotificationBroadcasterEngine old) =>
      notifier != old.notifier;
}


class NotificationBroadcaster extends StatelessWidget {
  NotificationBroadcaster({
    Key? key,
    required this.child,
    required this.setValueNotifier,
    required this.valueNotifierInitialValue
  }) : super(key: key);

  /// [child] is this widget's immediate descendant.
  final Widget child;

  /// [engine] initiates valueNotifier.
  late NotificationBroadcasterEngine engine;

  /// [valueNotifierInitialValue] initiates valueNotifier.
  var valueNotifierInitialValue;

  final Function setValueNotifier;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) => setValueNotifier(notification),
      child: child
    );
  }
}
