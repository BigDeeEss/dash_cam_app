//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/data_notifier.dart';

typedef NNCallback<T extends Notification>
    = bool Function(T notification);

class NN<T extends Notification> extends DataNotifier {
  NN({
    required Key? key,
    var data,
    required Widget child,
    required this.onNotification,
  })  : super(key: key, child: child, data: data);

  NNCallback<T> onNotification;
  late NotificationListener<T> listener;
  late DataNotifierService<T> notificationNotifier;
//   static NN of<T>(BuildContext context, Key key) => DataNotifierService of<T>(BuildContext context, Key key);

  @override
  Widget build(BuildContext context) {
    //  Define a listener object for notifications of type T, updating
    //  [notificationData] when T is of type U.
    listener = NotificationListener<T>(
      onNotification: onNotification,
      child: child,
    );

    //  Define a notification notifier object using [listener] and
    //  [notificationData] which issues notifiers to listenable objects
    //  below it in the widget tree.
    notificationNotifier = DataNotifierService(
      key: key,
      child: listener,
      context: context,
      data: data,
    );

    return notificationNotifier;
  }
}
