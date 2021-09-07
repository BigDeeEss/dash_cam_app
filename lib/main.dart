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

  //  Root widget of DashCamApp project defining the first widget built
  //  by runApp(...).
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DashCamApp',
      home: BasePage(
        title: 'Home',
      ),
    );
  }
}