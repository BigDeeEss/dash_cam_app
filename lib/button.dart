//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';

class Button extends StatelessWidget {
  const Button({
    required this.title,
    Key? key,
  }) : super(key: key);

  /// [title] is the page title displayed on the appBar of the
  /// [BasePage] widget.
  final String title;

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
          // child: Button(
          //     animation: this.animation
          // ),
        ),
      ),
    );
  }
}
