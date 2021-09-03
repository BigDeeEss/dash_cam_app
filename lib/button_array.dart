//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button.dart';

class ButtonArray extends StatefulWidget {
  const ButtonArray({Key? key}) : super(key: key);

  @override
  _ButtonArrayState createState() => _ButtonArrayState();
}

class _ButtonArrayState extends State<ButtonArray> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        width: double.infinity,
        height: double.infinity,
      ),
      child: Align(
        alignment: AppSettings.buttonAlignment,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: (AppSettings.buttonAlignment.y < 0)
              ? VerticalDirection.down
              : VerticalDirection.up,
          children: <Widget>[
            Button(
              title: 'Settings',
            ),
            Button(
              title: 'Files',
            ),
            Button(
              title: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
