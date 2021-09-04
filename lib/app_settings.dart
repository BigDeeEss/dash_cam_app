//  Import flutter packages.
import 'package:flutter/painting.dart';

/// Class for ease of import of app settings.
class AppSettings {
  /// [appBarHeightScaleFactor] defines a simple scale factor to apply to
  /// appBar when calculating bottomNavigationBar height in BasePage.
  static double appBarHeightScaleFactor = 1.0;

  /// [buttonAlignment] defines the anchor point for FAB placement in BasePage.
  static Alignment buttonAlignment = Alignment.bottomRight;

  /// [buttonPaddingDown] defines the padding for downward direction
  /// button positioning associated with BasePage.
  static EdgeInsetsDirectional buttonPaddingDown = EdgeInsetsDirectional.fromSTEB(
    buttonPaddingCrossAxis,
    buttonPaddingMainAxis,
    buttonPaddingCrossAxis,
    buttonPaddingMainAxisExtra,
  );

  /// [buttonPaddingCrossAxis] defines the cross axis padding between buttons
  /// associated with BasePage.
  static double buttonPaddingCrossAxis = 15;

  /// [buttonPaddingMainAxis] defines the main axis padding between buttons
  /// associated with BasePage.
  static double buttonPaddingMainAxis = 15.0;

  /// [buttonPaddingMainAxisExtra] defines extra padding in the main axis
  /// direction between buttons associated with BasePage.
  static double buttonPaddingMainAxisExtra = 10.0;

  /// [buttonPaddingUp] defines the padding for downward direction
  /// button positioning associated with BasePage.
  static EdgeInsetsDirectional buttonPaddingUp = EdgeInsetsDirectional.fromSTEB(
    buttonPaddingCrossAxis,
    buttonPaddingMainAxisExtra,
    buttonPaddingCrossAxis,
    buttonPaddingMainAxis,
  );
}
