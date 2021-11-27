// //  Import flutter packages.
// import 'package:flutter/material.dart';
//
// class ScrollNotificationListener
//     extends NotificationListener<ScrollNotification> {
//   ScrollNotificationListener({
//     Key? key,
//     required this.child
//   }) : super(key: key, child: child,);
//
//   final Widget child;
//
//   final ValueNotifier<double> notifier = ValueNotifier(0.0);
//
//   bool setValueNotifier(notification) {
//     if (notification is ScrollUpdateNotification) {
//       this.notifier.value = notification.metrics.pixels;
//     }
//     return true;
//   }
//
//   @override
//   NotificationListenerCallback<ScrollNotification> onNotification(notification) => setValueNotifier(notification);
// }
