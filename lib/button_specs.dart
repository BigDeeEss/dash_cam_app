//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/base_page.dart';

//  Class for ease of reference to specific button settings.
class ButtonSpec {
  const ButtonSpec({
    required this.icon,
    required this.onPressed,
    required this.size,
    required this.title,
  });

  //  [icon] is displayed on the FAB associated with [RouteSpec].
  final Icon icon;

  //  [onPressed] defines the action to be taken on activation
  //  of the associated FAB.
  final void Function(BuildContext context) onPressed;

  final double size;

  //  [title] of screen appearing on appBar.
  final String title;

// double screenDimension(BuildContext context);
}

// //  Eject button specs.
// ButtonSpec eject = ButtonSpec(
//   icon: Icon(CustomIcons.eject),
//   onPressed: (context) {
//     Navigator.of(context).pushReplacement(_createRoute(eject));
//   },
//   size: 50,
//   title: 'Eject',
// );

//  Home button specs.
ButtonSpec home = ButtonSpec(
  icon: Icon(CustomIcons.home),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(_createRoute(this.title)));
  },
  size: 50,
  title: 'Home',
);

//  Settings button specs.
ButtonSpec settings = ButtonSpec(
  icon: Icon(CustomIcons.cog_1),
  onPressed: (context) {
    Navigator.of(context).pushReplacement(_createRoute(this.title));
  },
  size: 50,
  title: 'Settings',
);

//  Implement PageRouteBuilder method for managing page/route transitions
//  that result from FAB activation associated with Button class.
Route _createRoute(String title) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        BasePage(
          title: title,
        ),
    transitionDuration: const Duration(seconds: 2),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(
        curve: curve,
      ));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}