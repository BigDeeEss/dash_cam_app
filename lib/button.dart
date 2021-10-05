//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_specs.dart';

//  Geometrical and functional button specs for [ButtonArray].
class Button extends StatelessWidget {
  /// Implements a single button item in ButtonArray.
  const Button({
    Key? key,
    required this.buttonSpec,
  }) : super(key: key);

  /// [buttonSpec] defines the button characteristics.
  final ButtonSpec buttonSpec;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: (AppSettings.buttonAlignment.y < 0)
            ? AppSettings.buttonPaddingDown
            : AppSettings.buttonPaddingUp,
        child: CircleAvatar(
          radius: this.buttonSpec.size,
          backgroundColor: Colors.lightBlue,
          child: IconButton(
            key: UniqueKey(),
            icon: this.buttonSpec.icon,
            color: Colors.white,
            onPressed: () => this.buttonSpec.onPressed(context),
          ),
        ),
      );
  }
}
