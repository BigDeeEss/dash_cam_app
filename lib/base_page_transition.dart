//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/base_page.dart';
import 'package:dash_cam_app/button_specs.dart';

//  An animated page transition for managing the page transition that occurs
//  following FAB activation in Button class.
Route basePageTranstion(ButtonSpec buttonSpec) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        BasePage(
          title: buttonSpec.title,
        ),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}