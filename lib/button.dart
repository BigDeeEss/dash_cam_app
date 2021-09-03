//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/base_page.dart';

class Button extends StatelessWidget {
  const Button({
    required this.title,
    Key? key,
  }) : super(key: key);

  /// [title] is the page title displayed on the appBar of the
  /// [BasePage] widget.
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (AppSettings.buttonAlignment.y < 0)
          ? AppSettings.buttonPaddingDown
          : AppSettings.buttonPaddingUp,
      child: Container(
        color: Colors.red,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Text(this.title),
        ),
      ),
    );
  }
}

//  Implement PageRouteBuilder method for managing page/route transitions
//  that result from FAB activation.
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
