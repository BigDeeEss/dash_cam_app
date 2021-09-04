//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button.dart';
import 'package:dash_cam_app/button_specs.dart';

class ButtonArray extends StatefulWidget {
  const ButtonArray({Key? key}) : super(key: key);

  @override
  _ButtonArrayState createState() => _ButtonArrayState();
}

class _ButtonArrayState extends State<ButtonArray> {
  @override
  Widget build(BuildContext context) {
    //  Use a Container-Align-Column construct to position FABs, which are
    //  built by the Button widget, in BasePage.
    return Container(
      //  Request that this container expands to fit the entire screen.
      constraints: BoxConstraints.expand(
        width: double.infinity,
        height: double.infinity,
      ),

      //  Position the button array according to Align specs.
      //  Specs provided by AppSettings.
      child: Align(
        alignment: AppSettings.buttonAlignment,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: (AppSettings.buttonAlignment.y < 0)
              ? VerticalDirection.down
              : VerticalDirection.up,
          children: <Widget>[
            Button(
              buttonSpec: settings,
            ),
            Button(
              buttonSpec: files,
            ),
            Button(
              buttonSpec: home,
            ),
          ],
        ),
      ),
    );
  }
}
