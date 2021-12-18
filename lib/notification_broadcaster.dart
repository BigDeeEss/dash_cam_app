//  Import flutter packages.
import 'package:flutter/material.dart';

/// [NotifcationBroadcasterService] is a base class for implementing a
/// notification broadcasting service.
abstract class NotifcationBroadcasterService<T extends Notification>
    extends InheritedWidget {
  const NotifcationBroadcasterService({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static NotifcationBroadcasterService of(BuildContext context) {
    final NotifcationBroadcasterService? result = context
        .dependOnInheritedWidgetOfExactType<NotifcationBroadcasterService>();
    assert(result != null, 'No NotifcationBroadcasterService found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(NotifcationBroadcasterService old) =>
      notifyOnChange();

  /// notifyOnChange is an abstract method which must be overridden by the
  /// mixin that specialises [NotifcationBroadcasterService].
  bool notifyOnChange();
}

mixin ScrollNotificationBroadcasterListener
    on NotifcationBroadcasterService<ScrollNotification> {
  /// [scrollPositionNotifier] records the current scroll position received
  /// by [scrollNotificationListener].
  ValueNotifier<double> scrollPositionNotifier = ValueNotifier(0.0);

  /// [scrollNotificationListener] implements the engine which specialises
  /// the generic class, [NotifcationBroadcasterService].
  late NotificationListener<ScrollNotification> scrollNotificationListener =
      NotificationListener<ScrollNotification>(
    // onNotification : (notification) => setValueNotifier(notification),
    onNotification: (notification) {
      if (notification is ScrollUpdateNotification) {
        scrollPositionNotifier.value = notification.metrics.pixels;
      }
      return true;
    },
    child: child,
  );

  /// [child] is the immediate descendant of [NotifcationBroadcasterService].
  late Widget child;

  /// [notifyOnChange] overrides the method bound to
  /// [NotifcationBroadcasterService].
  @override
  bool notifyOnChange() {
    return true;
  }

//   Widget scrollNotificationBroadcasterListenerBody()
}

class NotificationBroadcaster extends StatelessWidget {
  const NotificationBroadcaster({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
