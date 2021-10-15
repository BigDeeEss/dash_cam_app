//  Import dart and flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/skewed_transition.dart';
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button.dart';
import 'package:dash_cam_app/button_specs.dart';

class ButtonArray extends StatefulWidget {
  /// Implements an animated linear button array on screen.
  ButtonArray({
    Key? key,
    this.animation,
  }) : super(key: key);

  /// [animation] is used to animate the launch of buttons onto the screen.
  //
  //  Whilst this animation ranges from 0.0 to 1.0, in this instance the
  //  range of values 0.0--0.5 is reserved for animating the page transition
  //  whilst the range 0.5--1.0 is used for animating the buttons.
  //  [animation] is nullable because DashCamApp includes the call,
  //  BasePage(title: 'Home',).
  final Animation<double>? animation;

  @override
  _ButtonArrayState createState() => _ButtonArrayState();
}

class _ButtonArrayState extends State<ButtonArray> {
  bool animationTrigger = false;

  /// [buttonSpecList] defines the specs for buttons on each screen.
  static List<ButtonSpec> buttonSpecList = [
    settingsButton,
    filesButton,
    homeButton,
  ];

  /// [getButtonStartTime] calculates the start time for button animation.
  double getButtonStartTime(int i) {
    //  The total time for all button animation is a further fraction of
    //  three quarters of the total page transition time.
    //  The function below defines the start point in time for each button.
    return 0.25 + (i / (buttonSpecList.length + 1)) * 0.75;
  }

  /// [getButtonStopTime] calculates the stop time for button animation.
  double getButtonStopTime(int i) {
    //  The total time for all button animation is a further fraction of
    //  three quarters of the total page transition time.
    //  The function below defines the stop point in time for each button.
    return 0.25 + ((i + 2) / (buttonSpecList.length + 1)) * 0.75;
  }

  /// [getOffset] defines the starting position for each button.
  //
  //  [getOffset] calculates the position to be one screen width to the
  //  left/right of the button's final locatioin.
  Offset getOffset(BuildContext context) {
    //  Get size of screen in pixels.
    final Size size = MediaQuery.of(context).size;

    // Get characteristic button dimension including padding in pixels.
    double buttonDim =
        AppSettings.buttonSize + 2.0 * AppSettings.buttonPaddingCrossAxis;

    //  Convert [buttonDim] to an Offset.
    //  [AppSettings.buttonAlignment] switches between left and right entrance.
    return Offset(-AppSettings.buttonAlignment.x * size.width / buttonDim, 0);
  }

  /// [slidingButtonList] outputs a list of widgets.
  //
  //  All elements in the list produced by [slidingButtonList] are either
  //  a static or sliding button.
  List<Widget> slidingButtonList(
    BuildContext context,
    Animation<double>? animation,
    List<ButtonSpec> buttonSpecList,
  ) {
    //  Initialise widgetList so that it is ready for population in
    //  the for loop below.
    List<Widget> widgetList = [];

    //  Loop over items in buttonSpecList and convert each to either a static
    //  button (if animation is null) or a SlideTransition-SkewedTransition
    //  combination with button for its child (if not).
    for (int i = 0; i < buttonSpecList.length; i++) {
      if (animation == null) {
        //  If animation is null then add static button to widgetList.
        widgetList.add(Button(
          buttonSpec: buttonSpecList[i],
        ));
      } else {
        if (animationTrigger) {
          //  If animation is not null then add animated button to widgetList.
          widgetList.add(
            SlideTransition(
              position: Tween<Offset>(
                begin: getOffset(context),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  //  Staggered button movement.
                  curve: Interval(
                    getButtonStartTime(i),
                    getButtonStopTime(i),
                    curve: Curves.easeOutCubic,
                  ),
                  parent: animation,
                ),
              ),
              child: SkewedTransition(
                skewFactor: Tween<double>(
                  begin: -AppSettings.buttonAlignment.x * 0.3,
                  end: 0.0,
                ).animate(
                  CurvedAnimation(
                    //  Staggered button movement.
                    curve: Interval(
                      getButtonStartTime(i),
                      getButtonStopTime(i),
                      curve: Curves.easeOutCubic,
                    ),
                    parent: animation,
                  ),
                ),
                child: Button(
                  buttonSpec: buttonSpecList[i],
                ),
              ),
            ),
          );
        }
      }
    };
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    Animation<double> animation;

    if (widget.animation != null) {
      animation = widget.animation!..addStatusListener((status) {
        print(status);
        if (status == AnimationStatus.completed) {
          setState(() {
            animationTrigger = true;
          });
        }
      });
    }

    //  Use a Container-Align-Column construct to position items in the list
    //  generated by slidingButtonList(...).
    return Container(
      //  Request that this container expands to fit the entire screen.
      //  Required for calculating the button start position off-screen.
      constraints: BoxConstraints.expand(
        width: double.infinity,
        height: double.infinity,
      ),

      //  Position the button array according to Align specs.
      //  Specs provided by AppSettings.
      child: Align(
        alignment: AppSettings.buttonAlignment,
        child: Flex(
          direction: AppSettings.buttonAxis,
          textDirection: (AppSettings.buttonAlignment.x < 0)
              ? TextDirection.ltr
              : TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: (AppSettings.buttonAlignment.y < 0)
              ? VerticalDirection.down
              : VerticalDirection.up,
          children: slidingButtonList(
            context,
            widget.animation,
            buttonSpecList,
          ),
        ),
      ),
    );
  }
}
