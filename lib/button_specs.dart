//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/lib/custom_icons.dart';
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/base_page_transition.dart';
import 'package:dash_cam_app/zoom_page_transition.dart';

//  Class for ease of reference to specific button settings.
class ButtonSpec {
  const ButtonSpec({
    required this.icon,
    required this.onPressed,
    required this.size,
    required this.title,
  });

  //  [icon] corresponding to the page transition type.
  final Icon icon;

  //  [onPressed] defines the action to be taken when the associated button
  //  is activated.
  final void Function(BuildContext context) onPressed;

  //  [size] is the button characteristic dimension.
  final double size;

  //  [title] is the appBar title associated with the destination in
  //  the corresponding page transition type.
  final String title;
}

//  Home page button specs.
ButtonSpec home = ButtonSpec(
  icon: Icon(CustomIcons.home),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(ZoomPageTransition(
      buttonSpec: home,
    ));
  },
  size: AppSettings.buttonSize,
  title: 'Home',
);

//  Files page button specs.
ButtonSpec files = ButtonSpec(
  icon: Icon(CustomIcons.file_video),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(ZoomPageTransition(
      buttonSpec: files,
    ));
  },
  size: AppSettings.buttonSize,
  title: 'Files',
);

//  Settings page button specs.
ButtonSpec settings = ButtonSpec(
  icon: Icon(CustomIcons.cog_1),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(ZoomPageTransition(
      buttonSpec: settings,
    ));
  },
  size: AppSettings.buttonSize,
  title: 'Settings',
);

