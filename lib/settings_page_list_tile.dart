//  Import flutter packages.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [SettingsPageListTile] implements a bespoke listTile class that,
/// when used in conjunction with NotificationNotifier, will produce
/// a list tile which changes shape to accommodate ButtonArray.
class SettingsPageListTile<T> extends ValueListenableBuilder<T> {
  const SettingsPageListTile({
    Key? key,
    required ValueListenable<T> valueListenable,
    required ValueWidgetBuilder<T> builder,
    Widget? child,
  }) : super(
    key: key,
    valueListenable: valueListenable,
    builder: builder,
    child: child,
  );
  // final ValueListenable<T> valueListenable;
  // final ValueWidgetBuilder<T> builder;
  // final Widget? child;
//   @override
//   Widget build(BuildContext context) {
//     return widget.builder(context, value, widget.child);
//   }
}