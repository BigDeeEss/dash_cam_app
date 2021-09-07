//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_array.dart';

/// Implements a basic page layout design.
class BasePage extends StatefulWidget {
  const BasePage({
    this.animation,
    required this.title,
    Key? key,
  }) : super(key: key);

  /// [animation] is used to animate the launch of buttons onto the screen.
  //  Whilst this animation ranges from 0.0 to 1.0, in this instance the
  //  values 0.0--0.5 animate the page transition leaving the range 0.5--1.0
  //  for animating the buttons.
  // [animationb] is nullable because DashCamApp calls
  // BasePage(title: 'Home',).
  final Animation<double>? animation;

  /// [title] is the page title displayed on the appBar in BasePage.
  final String title;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      //  Use Builder widget because it is not possible to get the appBar
      //  height from the current BuildContext when it doesn't yet include the
      //  Scaffold class being returned by the parent widget.
      //
      //  The Builder class delegates its build to a callback.
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          //  [height] variable for storing appBar height.
          double height = MediaQuery.of(context).padding.top + kToolbarHeight;

          return BottomAppBar(
            color: Colors.blue,
            child: Row(
              children: <Widget>[
                SizedBox(
                  //  Set height of the BottomAppBar class variable using
                  //  SizedBox. Get height from [context] by first
                  //  extracting the Scaffold that immediately wraps this
                  //  widget, and then getting the value for appBarMaxHeight.
                  height: height * AppSettings.appBarHeightScaleFactor,
                ),
              ],
            ),
          );
        },
      ),

      //  A linear array of buttons.
      body: ButtonArray(
        animation: widget.animation
      ),
    );
  }
}
