//  Import flutter packages.
import 'package:flutter/painting.dart';

/// Class for ease of import of app settings.
class AppSettings {
  /// [appBarHeightScaleFactor] defines a simple scale factor to apply to
  /// appBar when calculating bottomNavigationBar height in BasePage class.
  static double appBarHeightScaleFactor = 1.0;

  /// [buttonAlignment] defines the anchor point for button placement
  /// in ButtonArray class.
  static Alignment buttonAlignment = Alignment.bottomRight;

  /// [buttonPaddingDown] defines the padding for downward direction
  /// button positioning in Button class.
  static EdgeInsetsDirectional buttonPaddingDown = EdgeInsetsDirectional.fromSTEB(
    buttonPaddingCrossAxis,
    buttonPaddingMainAxis,
    buttonPaddingCrossAxis,
    buttonPaddingMainAxisExtra,
  );

  /// [buttonPaddingCrossAxis] defines the cross axis padding between buttons.
  static double buttonPaddingCrossAxis = 15;

  /// [buttonPaddingMainAxis] defines the main axis padding between buttons.
  static double buttonPaddingMainAxis = 15.0;

  /// [buttonPaddingMainAxisExtra] defines extra padding in main axis direction.
  static double buttonPaddingMainAxisExtra = 10.0;

  /// [buttonPaddingUp] defines the padding for downward direction
  /// button positioning in Button class.
  static EdgeInsetsDirectional buttonPaddingUp = EdgeInsetsDirectional.fromSTEB(
    buttonPaddingCrossAxis,
    buttonPaddingMainAxisExtra,
    buttonPaddingCrossAxis,
    buttonPaddingMainAxis,
  );

  /// [buttonSize] defines the button size in Button class..
  static double buttonSize = 56.0;

  /// [pageTransitionTime] defines the page transition time including
  /// button animation. Any page transition is allocated time for transitioning
  /// and animating page content (e.g. buttons) in the ration 1:4.
  static int pageTransitionTime = 1200;
}
