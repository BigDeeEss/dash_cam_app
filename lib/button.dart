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
    return Container(
      child: Text(this.title),
    );
  }
}
