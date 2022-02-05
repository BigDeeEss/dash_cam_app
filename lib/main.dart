//  Import flutter packages.
import 'package:flutter/material.dart';

//  Import project-specific files.
import 'package:dash_cam_app/base_page.dart';
import 'package:dash_cam_app/page_specs.dart';

//  App start point.
void main() {
  runApp(const _DashCamApp());
}

/// [_DashCamApp] is the root widget of this project.
class _DashCamApp extends StatelessWidget {
  const _DashCamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '_DashCamApp',

      //  Invoke a generic page layout.
      //  A similar UI is presented for each page(route).
      home: BasePage(
        pageSpec: settingsPage,
      ),
    );
  }
}
