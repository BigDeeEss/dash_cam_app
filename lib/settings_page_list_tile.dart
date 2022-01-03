//  Import flutter packages.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [SettingsPageListTile] implements a bespoke listTile class that,
/// when used in conjunction with NotificationNotifier, will produce
/// a list tile which changes shape to accommodate ButtonArray.
class SettingsPageListTile<T> extends StatelessWidget {
  const SettingsPageListTile({
    Key? key,
    required this.valueListenable,
    Widget? this.child,
  }) : super(key: key);

  final ValueListenable<T> valueListenable;
  final Widget? child;
  final List<Color> colors = const [
    Colors.blueGrey,
    Colors.green,
    Colors.deepOrange,
    Colors.purple,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<T>(
      valueListenable: valueListenable,
      builder: (BuildContext context, T value, __,){
        return Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[4],
        );
      },
    );
  }
}

