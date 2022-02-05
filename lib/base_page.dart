//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/animation_status_notification.dart';
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_array.dart';
import 'package:dash_cam_app/page_specs.dart';
import 'package:dash_cam_app/notification_notifier.dart';

class BasePage extends StatefulWidget {
  /// [BasePage] implements a generic page layout design so that a
  /// similar UI is presented for each route.
  BasePage({
    Key? key,
    required this.pageSpec,
    this.pageTransitionAnimation,
  }) : super(key: key);

  /// [pageSpec] defines the page content.
  final PageSpec pageSpec;

  /// [pageTransitionAnimation] drives the page transition. When it completes
  /// the animation of ButtonArray begins.
  ///
  /// [pageTransitionAnimation] is nullable because _DashCamApp includes
  /// the call, BasePage(title: 'Home',).
  final Animation<double>? pageTransitionAnimation;

  /// [animationStatus]...
  final ValueNotifier<AnimationStatus> animationStatus
      = ValueNotifier(AnimationStatus.completed);

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
      body: NotificationNotifier<AnimationStatusNotification, AnimationStatus>(
        notificationData: widget.animationStatus,
        onNotification: (animationStatusNotification) {
          if (animationStatusNotification is AnimationStatusNotification) {
            animationStatusNotification.prn();
          }
          // widget.animationStatus.value = animationStatusNotification.status;
          return true;
        },
        child: Stack(
          children: <Widget>[
            widget.pageSpec.contents,
            ButtonArray(
              pageTransitionAnimation: widget.pageTransitionAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
