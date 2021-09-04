//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button.dart';
import 'package:dash_cam_app/button_specs.dart';

class ButtonArray extends StatefulWidget {
  ButtonArray({Key? key}) : super(key: key);

  @override
  _ButtonArrayState createState() => _ButtonArrayState();
}

class _ButtonArrayState extends State<ButtonArray>
    with SingleTickerProviderStateMixin {
  // needs late because animationcontroller cannot be null.
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  Button? homeButton;
  Button? settingsButton;
  Button? filesButton;

  void addButtons() {
    homeButton = Button(buttonSpec: home);
    settingsButton = Button(buttonSpec: settings);
    filesButton = Button(buttonSpec: files);
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    // _controller.forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-0.5, 0.0),
      end: Offset.zero,
    ).animate(_controller);

    _controller.addListener(() {
      print(_offsetAnimation.value);
    });


    print('4');
    print(homeButton);
    print('4');
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print('1');
      print(homeButton);
      print('1');
      addButtons();
      print('2');
      print(homeButton);
      print('2');
      _controller.forward();
    });
    print('5');
    print(homeButton);
    print('5');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('3');
    print(homeButton);
    print('3');
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
            SlideTransition(
              child: homeButton,
              position: _offsetAnimation,
            ),
          ],
        ),
      ),
    );
  }
}
