//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/animation_status_notification.dart';
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button_array.dart';
import 'package:dash_cam_app/notification_notifier.dart';
import 'package:dash_cam_app/page_specs.dart';

/// [BasePage] implements a generic page layout design so that a
/// similar UI is presented for each page/route.
class BasePage extends StatefulWidget {
  BasePage({
    Key? key,
    required this.pageSpec,
    this.pageTransitionAnimation,
  }) : super(key: key);

  /// [pageSpec] defines the page content.
  final PageSpec pageSpec;

  /// [pageTransitionAnimation] drives the transition between different pages.
  /// When it completes ButtonArray is animated.
  ///
  /// [pageTransitionAnimation] is nullable because _DashCamApp includes
  /// the call, BasePage(title: 'Home',).
  final Animation<double>? pageTransitionAnimation;

  /// [pageTransitionAnimationStatus] notifies listenable variables on
  /// changes to its value. [pageTransitionAnimationStatus] is provided
  /// as an input to the instance of NotificationNotifier in the build
  /// method below. Access to to [pageTransitionAnimationStatus] is given
  /// to widgets below BasePage in the widget tree via the instance of
  /// _NotificationNotifierService which is part of NotificationNotifier.
  final ValueNotifier<AnimationStatus> pageTransitionAnimationStatus =
      ValueNotifier(AnimationStatus.completed);

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
      //  Insert instance of NotificationNotifier above the Stack widget
      //  in order to be able catch AnimationStatusNotifications
      //  generated within ButtonArray.
      body: NotificationNotifier<AnimationStatusNotification, AnimationStatus>(
        notificationData: widget.pageTransitionAnimationStatus,
        onNotification: (animationStatusNotification) {
          // Use 'is' to both check and promote animationStatusNotification
          // up to type AnimationStatusNotification in code that follows.
          if (animationStatusNotification is AnimationStatusNotification) {
            widget.pageTransitionAnimationStatus.value =
                animationStatusNotification.animationStatus;
            animationStatusNotification.prn();
          }
          // Return true to indicate that AnimationStatusNotification
          // has been handled.
          return true;
        },
        child: Stack(
          children: <Widget>[
            //  Ensure that [ButtonArray] sits above the page content by
            //  placing it last in a Stack list of children.
            widget.pageSpec.contents,
            ButtonArray(
              //  ButtonArray requires the pageTransitionAnimation in order to
              //  know when to initiate ButtonArray animation.
              //  TODO: Consider using AnimationStatusNotification.
              pageTransitionAnimation: widget.pageTransitionAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
