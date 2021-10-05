//  Import flutter packages.
import 'package:flutter/material.dart';

//  Import project-specific files.
import 'package:dash_cam_app/base_page.dart';
import 'package:dash_cam_app/page_specs.dart';

//  App start point.
void main() {
  runApp(const DashCamApp());
}

class DashCamApp extends StatelessWidget {
  /// The root widget of this dash cam project called by runApp(...).
  const DashCamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DashCamApp',
      home: BasePage(
        // pageSpec: homePage,
        pageSpec: settingsPage,
      ),
    );
  }
}
