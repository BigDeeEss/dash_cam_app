//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/page_specs.dart';
import 'package:dash_cam_app/base_page.dart';

class ZoomPageTransition extends PageRouteBuilder {
  final PageSpec pageSpec;

  ZoomPageTransition({
    //  Add constructor details specific to ZoomPageTransition.
    required this.pageSpec,
  }) : super(
    //  Add constructor details specific to PageRouteBuilder.
    pageBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) => BasePage(
      animation: animation,
      pageSpec: pageSpec,
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
            0.0, 0.25,
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
      child: child,
    ),
  );
}
