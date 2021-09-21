//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/button.dart';
import 'package:dash_cam_app/button_specs.dart';

class AnimatedButton extends AnimatedWidget {
  /// Creates a fractional translation transition.
  ///
  /// The [buttonSpec] argument must not be null.
  //
  //  The skewFactor animation is required by the super constructor,
  //  and so needs to be defined as an input for AnimatedButton.
  const AnimatedButton({
    Key? key,
    required this.buttonSpec,
    required Animation<double> skewFactor,
  })  : assert(buttonSpec != null),
        assert(skewFactor != null),
        super(key: key, listenable: skewFactor);

  //  Redirects the getter for skewFactor onto the listenable variable,
  //  which a member of AnimatedWidget, and recasts it to be of type
  //  Animation<double>.
  Animation<double> get skewFactor => listenable as Animation<double>;

  /// [buttonSpec] defines the button characteristics such as icon, route etc.
  final ButtonSpec buttonSpec;

  @override
  Widget build(BuildContext context) {
    //  Build a Transform widget using the value associated with the
    //  Animation<double> variable as the input to Matrix4.skewX.
    return Transform(
      transform: Matrix4.skewX(skewFactor.value),
      child: Button(buttonSpec: buttonSpec),
    );
  }
}
