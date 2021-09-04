//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_specs.dart';

//  Geometrical and functional button specs for [ButtonArray].
class Button extends StatelessWidget {
  const Button({
    required this.buttonSpec,
    Key? key,
  }) : super(key: key);

  /// [title] is the page title displayed in BasePage.
  final ButtonSpec buttonSpec;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (AppSettings.buttonAlignment.y < 0)
          ? AppSettings.buttonPaddingDown
          : AppSettings.buttonPaddingUp,
      child: Container(
        color: Colors.red,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Text(this.buttonSpec.title),
        ),
      ),
    );
  }
}