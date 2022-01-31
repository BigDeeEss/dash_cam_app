//  Import dart and flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/skewed_transition.dart';
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button.dart';
import 'package:dash_cam_app/button_specs.dart';
import 'package:dash_cam_app/animation_status_notification.dart';
import 'package:dash_cam_app/data_notifier.dart';


class ButtonArray extends StatefulWidget {
  /// Implements an animated linear button array on screen.
  ButtonArray({
    Key? key,
    this.pageTransitionAnimation,
  }) : super(key: key);

  /// [pageTransitionAnimation] is derived from the page transition and
  /// is only listened to in this class.
  ///
  /// When the page transition is complete a listener triggers two things:
  /// (i) the removal of the build blocker, animationBlocker, which prevents
  /// button movement during the page transition, and (ii) initiation of a
  /// secondary animation that moves the buttons across the screen.
  ///
  /// [pageTransitionAnimation] is nullable because _DashCamApp includes
  /// the call, BasePage(title: 'Home',).
  final Animation<double>? pageTransitionAnimation;

  @override
  _ButtonArrayState createState() => _ButtonArrayState();
}

class _ButtonArrayState extends State<ButtonArray>
    with SingleTickerProviderStateMixin {
  /// [buttonAnimationList] specifies the animation to move and shape
  /// buttons in the button array.
  ///
  /// [buttonAnimationList] starts once the page transition animation completes.
  ///
  /// [buttonAnimationList] is instantiated within [initState].
  late List<CurvedAnimation> buttonAnimationList = [];

  /// [buttonAnimationController] controls elements in [buttonAnimationList].
  late AnimationController buttonAnimationController;

  /// [animationBlocker] set to true stops builder from animating buttons.
  bool animationBlocker = true;

  final ValueNotifier<AnimationStatus> animationStatus
      = ValueNotifier(AnimationStatus.completed);

  /// [buttonSpecList] defines the specs for buttons on each screen.
  static List<ButtonSpec> buttonSpecList = [
    settingsButton,
    filesButton,
    homeButton,
  ];

  @override
  void dispose () {
    buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    //  Instantiate [buttonAnimationController]; required for defining
    //  [buttonAnimationList].
    buttonAnimationController =  AnimationController(
      vsync: this,
      duration: Duration(milliseconds: AppSettings.buttonAnimationTime),
    )..addStatusListener((status) {
      print('Test 1: ${AnimationStatus.completed}');
      animationStatus.value = status;
      if (status == AnimationStatus.completed) {
        AnimationStatusNotification(status).dispatch(context);
      }
    });

    //  Generate [buttonAnimationList] by iterating over [buttonSpecList]
    //  and converting each element to an instance of CurvedAnimation.
    buttonSpecList.forEach((elem) {
      //  Get index of spec in buttonSpecList.
      int index = buttonSpecList.indexOf(elem);

      //  Instantiate [buttonAnimationList].
      buttonAnimationList.add(
        CurvedAnimation(
          //  Staggered button movement.
          curve: Interval(
            getButtonStartTime(index),
            getButtonStopTime(index),
            curve: Curves.easeOutCubic,
          ),
          parent: buttonAnimationController,
        )
      );
    });
  }

  /// [getButtonStartTime] calculates the start time for button animation.
  double getButtonStartTime(int i) {
    //  The total time for all buttons to finish animating is defined
    //  by buttonAnimationTime in appSettings. The function below defines
    //  a staggered start point in time for each button.
    return (i / (buttonSpecList.length + 1));
  }

  /// [getButtonStopTime] calculates the stop time for button animation.
  double getButtonStopTime(int i) {
    //  The total time for all buttons to finish animating is defined
    //  by buttonAnimationTime in appSettings. The function below defines
    //  a staggered stop point in time for each button.
    return ((i + 2) / (buttonSpecList.length + 1));
  }

  /// [getButtonStartOffset] defines the starting position for each button.
  ///
  /// [getButtonStartOffset] calculates the position to be one screen width to the
  /// left/right of the button's final location.
  Offset getButtonStartOffset(BuildContext context) {
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
  ///
  /// All elements in the list produced by [slidingButtonList] are either
  /// a static or sliding button.
  List<Widget> slidingButtonList(
    BuildContext context,
    Animation<double>? pageTransitionAnimation,
    List<ButtonSpec> buttonSpecList,
  ) {
    //  Initialise slidingButtonWidgetList so that it is ready for population.
    List<Widget> slidingButtonWidgetList = [];

    //  Loop over items in buttonSpecList and convert each to either a static
    //  button (if pageTransitionAnimation is null) or a
    //  SlideTransition-SkewedTransition combination with button for
    //  its child (if not).
    for (int i = 0; i < buttonSpecList.length; i++) {
      if (pageTransitionAnimation == null) {
        //  If null then add static button to slidingButtonWidgetList.
        slidingButtonWidgetList.add(Button(
          buttonSpec: buttonSpecList[i],
        ));
      } else {
        //  If not null then add animated button to slidingButtonWidgetList.
        if (!animationBlocker) {
          //  Only add an animated button if animationBlocker is set to false.
          slidingButtonWidgetList.add(
            SlideTransition(
              position: Tween<Offset>(
                begin: getButtonStartOffset(context),
                end: Offset.zero,
              ).animate(buttonAnimationList[i]),
              child: SkewedTransition(
                skewFactor: Tween<double>(
                  begin: -AppSettings.buttonAlignment.x * 0.3,
                  end: 0.0,
                ).animate(buttonAnimationList[i]),
                child: Button(
                  buttonSpec: buttonSpecList[i],
                ),
              ),
            ),
          );
        }
      }
    }

    return slidingButtonWidgetList;
  }

  @override
  Widget build(BuildContext context) {
    //  Add a status listener to widget.pageTransitionAnimation in order
    //  to trigger a setState that removes the animationBlocker and starts
    //  buttonAnimationController.
    if (widget.pageTransitionAnimation != null) {
      widget.pageTransitionAnimation!..addStatusListener((status) {
        print('Test 2: ${status}');
        if (status == AnimationStatus.completed) {
          setState(() {
            animationBlocker = false;
            buttonAnimationController.forward();
          });
        }
      });
    }

    //  TODO: Implement getRect here to obtain button rect.

    //  Use a Container-Align-Column construct to position items in the list
    //  generated by slidingButtonList(...).
    return DataNotifier(
      key: ValueKey('DataNotifier test'),
      data: animationStatus,
      child: Container()
    );
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
            widget.pageTransitionAnimation,
            buttonSpecList,
          ),
        ),
      ),
    );
  }
}
