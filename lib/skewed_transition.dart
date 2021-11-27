//  Import flutter packages.
import 'package:flutter/material.dart';

class SkewedTransition extends AnimatedWidget {
  /// Creates a skewed transition.
  //
  //  The skewFactor animation is required by the super constructor,
  //  and so needs to be defined as an input for skewedTransition.
  const SkewedTransition({
    Key? key,
    this.child,
    required Animation<double> skewFactor,
  })  : assert(skewFactor != null),
        super(key: key, listenable: skewFactor);

  //  Redirect the getter for skewFactor onto the listenable variable,
  //  which is a member of AnimatedWidget, and recast it to be of type
  //  Animation<double>.
  Animation<double> get skewFactor => listenable as Animation<double>;

  /// The widget below this widget in the widget tree.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    //  Build a Transform widget using the value associated with the
    //  Animation<double> variable as the input to Matrix4.skewX.
    return Transform(
      transform: Matrix4.skewX(skewFactor.value),
      child: child,
    );
  }
}
