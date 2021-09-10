//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button.dart';
import 'package:dash_cam_app/button_specs.dart';

class ButtonArray extends StatefulWidget {
  ButtonArray({
    this.animation,
    Key? key,
  }) : super(key: key);

  // [animation] is used to animate the launch of buttons onto the screen.
  //  Whilst this animation ranges from 0.0 to 1.0, in this instance the
  //  range of values 0.0--0.5 is reserved got animating the page transition
  //  whilst the range 0.5--1.0 is used for animating the buttons.
  //  [animation] is nullable because DashCamApp calls BasePage(title: 'Home',).
  final Animation<double>? animation;

  @override
  _ButtonArrayState createState() => _ButtonArrayState();
}

class _ButtonArrayState extends State<ButtonArray> {
  static List<ButtonSpec> buttonSpecList= [
    settings,
    files,
    home,
  ];

  //  TODO: move the following to app_settings.dart.
  static const double initialOffsetX = -1;
  static const double intervalStart = 0.5;
  static const double intervalEnd = 1.0;

  List<Button> makeButtonList(List<ButtonSpec> buttonSpecList) {
    List<Button> buttonList = [];

    buttonSpecList.forEach((item) => buttonList.add(Button(buttonSpec: item)));

    return buttonList;
  }

  //  [slidingButton] is a class method which outputs either a static
  //  button or a sliding button.
  List<Widget> slidingButtonList(Animation<double>? animation, List<ButtonSpec> buttonSpecList) {
    final List<Button> buttonList = makeButtonList(buttonSpecList);

    List<Widget> widgetList = [];;

    buttonList.forEach((item) {
      //  If animation is null the return a static button; if not null then
      //  return a SlideTransition. Both use the base button class.
      if (animation == null) {
        widgetList.add(item);
      } else {
        widgetList.add(
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset(initialOffsetX, 0),
              end: Offset(0, 0),
            ).animate(
              CurvedAnimation(
                curve: Interval(
                  intervalStart,intervalEnd,
                  // buttonSpec.start,
                  // buttonSpec.stop,
                  curve: Curves.easeOutCubic,
                ),
                parent: animation,
              ),
            ),
            child: item,
          ),
        );
      }
    });
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    //  Use a Container-Align-Column construct to position [filesButton],
    //  [homeButton] and [settingsButton].
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
          children: slidingButtonList(widget.animation, buttonSpecList,),
        ),
      ),
    );
  }
}
