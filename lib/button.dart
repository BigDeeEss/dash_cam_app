//  Import flutter packages.
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_specs.dart';
import 'package:dash_cam_app/global_key_extension.dart';

//  Geometrical and functional button specs for [ButtonArray].
class Button extends StatelessWidget {
  /// Implements a single button item in ButtonArray.
  Button({
    Key? key,
    required this.buttonSpec,
  }) : super(key: key);

  /// [buttonSpec] defines the button characteristics.
  final ButtonSpec buttonSpec;

  final GlobalKey globalKey = GlobalKey();
  final GlobalKey<RectGetterState> rectGetterKey = RectGetter.createGlobalKey();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print('GlobalKeyExtension: absolute coordinates on screen: ${globalKey.globalPaintBounds}');
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print('RectGetter: absolute coordinates on screen: ${RectGetter.getRectFromKey(rectGetterKey)}');
    });

    //  An IconButton with a circular background and geometry-dependent padding.
    return RectGetter(
      key: rectGetterKey,
      child: Container(
        key: globalKey,
        decoration: BoxDecoration(
          border: AppSettings.drawLayoutBounds
              ? Border.all(width: 0.0, color: Colors.redAccent) : null,
        ),
        child: Padding(
          padding: (AppSettings.buttonAlignment.y < 0)
              ? AppSettings.buttonPaddingDown
              : AppSettings.buttonPaddingUp,
          child: Container(
            decoration: BoxDecoration(
              border: AppSettings.drawLayoutBounds
                  ? Border.all(width: 0.0, color: Colors.redAccent) : null,
            ),
            child:CircleAvatar(
              radius: this.buttonSpec.size / 2.0,
              backgroundColor: Colors.lightBlue,
              child: IconButton(
                icon: this.buttonSpec.icon,
                color: Colors.white,
                onPressed: () => this.buttonSpec.onPressed(context),
              ),
            ),
          ),
        ),
      ),
    );

    return Container(
      key: globalKey,
      decoration: BoxDecoration(
       border: AppSettings.drawLayoutBounds
           ? Border.all(width: 0.0, color: Colors.redAccent) : null,
      ),
      child: Padding(
        padding: (AppSettings.buttonAlignment.y < 0)
            ? AppSettings.buttonPaddingDown
            : AppSettings.buttonPaddingUp,
        child: Container(
          decoration: BoxDecoration(
           border: AppSettings.drawLayoutBounds
               ? Border.all(width: 0.0, color: Colors.redAccent) : null,
          ),
          child:CircleAvatar(
            radius: this.buttonSpec.size / 2.0,
            backgroundColor: Colors.lightBlue,
            child: IconButton(
              icon: this.buttonSpec.icon,
              color: Colors.white,
              onPressed: () => this.buttonSpec.onPressed(context),
            ),
          ),
        ),
      ),
    );
  }
}
