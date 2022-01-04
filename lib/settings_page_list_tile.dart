//  Import flutter packages.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/settings_page_list_tile_clipper.dart';

/// [SettingsPageListTile] implements a bespoke listTile class that,
/// when used in conjunction with NotificationNotifier, will produce
/// a list tile which changes shape to accommodate ButtonArray.
class SettingsPageListTile extends StatelessWidget {
  const SettingsPageListTile({
    Key? key,
    required this.valueListenable,
    Widget? this.child,
  }) : super(key: key);

  final ValueListenable<double> valueListenable;
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
    return ValueListenableBuilder<double>(
      valueListenable: valueListenable,
      builder: (
        BuildContext context,
        double value,
        __,
      ) {
        return ClipPath(
            clipper: SettingsPageListTileClipper(

            ),
            // child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
          child: Card(
              child: Container(
                height: 50.0,
                width: 50,
                alignment: Alignment.center,
                color: colors[4],
              ),
            ),
          // ),
        );
      },
    );
  }
}
