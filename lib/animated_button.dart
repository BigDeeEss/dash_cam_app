//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/animated_button.dart';
import 'package:dash_cam_app/app_settings.dart';
import 'package:dash_cam_app/button.dart';
import 'package:dash_cam_app/button_specs.dart';

// class AnimatedButton extends AnimatedWidget {
//
//     const AnimatedButton({
//       Key? key,
//     }) : super(key: key, listenable: controller);
//
//     Animation<double> get _progress => listenable as Animation<double>;
//
//     @override
//     Widget build(BuildContext context) {
//       return Transform.rotate(
//         angle: _progress.value * 2.0 * math.pi,
//         child: Container(
//           width: 200.0,
//           height: 200.0,
//           color: Colors.teal,
//           child: const Center(
//             child: Text(
//               'Woolha.com',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//         ),
//       );
//     }
// }

class AnimatedButton extends AnimatedWidget {
  /// Creates a fractional translation transition.
  ///
  /// The [position] argument must not be null.
  const AnimatedButton({
    Key? key,
    required Animation<double> skewFactor,
    required this.buttonSpec,
    this.transformHitTests = true,
    this.child,
  }) : assert(skewFactor != null),
        super(key: key, listenable: skewFactor);

  Animation<double> get skewFactor => listenable as Animation<double>;
  final ButtonSpec buttonSpec;

  /// Whether hit testing should be affected by the slide animation.
  ///
  /// If false, hit testing will proceed as if the child was not translated at
  /// all. Setting this value to false is useful for fast animations where you
  /// expect the user to commonly interact with the child widget in its final
  /// location and you want the user to benefit from "muscle memory".
  final bool transformHitTests;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(skewFactor.value),
      child: Button(buttonSpec: buttonSpec),
    );
  }
}