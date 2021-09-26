//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_specs.dart';

//  Geometrical and functional button specs for [ButtonArray].
class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.buttonSpec,
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
          child: SizedBox(
            height: this.buttonSpec.size,
            width: this.buttonSpec.size,
            child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
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
