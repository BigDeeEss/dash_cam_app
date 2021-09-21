//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_specs.dart';
import 'package:dash_cam_app/base_page.dart';

class ZoomPageTransition extends PageRouteBuilder {
  final ButtonSpec buttonSpec;

  ZoomPageTransition({
    //  Add constructor details specific to ZoomPageTransition.
    required this.buttonSpec,
  }) : super(
    //  Add constructor details specific to PageRouteBuilder.
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) => BasePage(
      title: buttonSpec.title,
      animation: animation,
      controller: animation
    ),

    //  [transitionDuration] includes the page transition time AND the button
    //  animation time.
    transitionDuration: Duration(milliseconds: AppSettings.pageTransitionTime),

    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) => ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Interval(
            0.0, 0.5,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      child: child,
    ),
  );
}
