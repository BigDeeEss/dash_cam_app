//  Import flutter packages.
import 'package:flutter/material.dart';

//  Import project-specific files.
import 'package:dash_cam_app/base_page.dart';

//  App start point.
void main() {
  runApp(const DashCamApp());
}

class DashCamApp extends StatelessWidget {
  //  Default constructor required because there is a const keyword
  //  in 'runApp(const DashCamApp(...));' above.
  const DashCamApp({Key? key}) : super(key: key);

  //  Root widget of DashCamApp project called by runApp(...).
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DashCamApp',

      //  [BasePage] defines a generic page layout for use with all pages.
      home: BasePage(
        title: 'Home',
      ),
    );
  }
}
