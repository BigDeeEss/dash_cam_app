//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_array.dart';
import 'package:dash_cam_app/page_specs.dart';

class BasePage extends StatefulWidget {
  /// Implements a basic generic page layout design.
  const BasePage({
    Key? key,
    this.animation,
    required this.pageSpec,
  }) : super(key: key);

  /// [animation] is used to animate the launch of buttons onto the screen.
  ///
  /// Whilst this animation ranges from 0.0 to 1.0, in this instance the
  /// range of values 0.0--0.5 is reserved for animating the page transition
  /// whilst the range 0.5--1.0 is used for animating the buttons.
  /// [animation] is nullable because DashCamApp includes the call,
  /// BasePage(title: 'Home',).
  final Animation<double>? animation;

  /// [pageSpec] defines the page content.
  final PageSpec pageSpec;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageSpec.title),
      ),

      //  Use Builder widget because it is not possible to get the appBar
      //  height from the current BuildContext when it doesn't yet include the
      //  Scaffold class being returned by the parent widget.
      //
      //  The Builder class delegates its build to a callback.
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          double appBarHeight =
              MediaQuery.of(context).padding.top + kToolbarHeight;

          return BottomAppBar(
            color: Colors.blue,
            child: SizedBox(
              //  Set height of the BottomAppBar class variable using
              //  SizedBox. Get height from [context] by first
              //  extracting the Scaffold that immediately wraps this
              //  widget, and then getting the value for appBarMaxHeight.
              height: appBarHeight * AppSettings.appBarHeightScaleFactor,
            ),
          );
        },
      ),

      //  Ensure that [ButtonArray] sits above the page content using
      //  a Stack widget.
      body: Stack(
        children: <Widget>[
          widget.pageSpec.contents,
          ButtonArray(
            animation: widget.animation,
          ),
        ],
      ),
    );
  }
}
