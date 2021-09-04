//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/base_page_transition.dart';
import 'package:dash_cam_app/lib/custom_icons.dart';

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

  //  [onPressed] defines the action to be taken when the associated FAB
  //  is activated.
  final void Function(BuildContext context) onPressed;

  //  [size] is the FAB characteristic dimension.
  final double size;

  //  [title] is the appBar title associated with the destination in
  //  the corresponding page transition type.
  final String title;
}

//  Home page button specs.
ButtonSpec home = ButtonSpec(
  icon: Icon(CustomIcons.home),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(basePageTranstion(home));
  },
  size: 50,
  title: 'Home',
);

//  Files page button specs.
ButtonSpec files = ButtonSpec(
  icon: Icon(CustomIcons.videocam),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(basePageTranstion(home));
  },
  size: 50,
  title: 'Files',
);

//  Settings page button specs.
ButtonSpec settings = ButtonSpec(
  icon: Icon(CustomIcons.cog_1),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(basePageTranstion(settings));
  },
  size: 50,
  title: 'Settings',
);

