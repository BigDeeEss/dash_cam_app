//  Import flutter packages.
import 'package:flutter/material.dart';

class SettingsPageListTileClipper extends CustomClipper<Path> {
  const SettingsPageListTileClipper({
    required this.context,
  });

  final BuildContext context;

  @override
  Path getClip(Size size) {
    //  Get size of screen in pixels.
    final Size screenSize = MediaQuery.of(context).size;

    print(size);
    print(screenSize);

    Path path = Path()
      ..lineTo(screenSize.width, 0.0)
      ..lineTo(screenSize.width, screenSize.height/3)
      ..lineTo(screenSize.width * 0.75, screenSize.height/2)
      ..lineTo(screenSize.width * 0.75, screenSize.height)
      ..lineTo(0.0, screenSize.height)
      ..lineTo(0.0, 0.0);

    // Path path1 = Path()
    //   ..lineTo(0, size.height)
    //   ..lineTo(size.width/2, size.height)
    //   ..lineTo(0, 0);
    //
    // Path path2 = Path()
    //   ..lineTo(size.width/2, size.height)
    //   ..lineTo(size.width/2, -size.height)
    //   ..lineTo(0, 0);
    //
    // Path path3 = Path()
    //   ..lineTo(0, screenSize.height)
    //   ..lineTo(screenSize.width/3, screenSize.height)
    //   ..lineTo(screenSize.width/3, 0)
    //   ..close();
    //
    // path1.addPath(path3, Offset(size.width/3,0));

    // return path1;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}