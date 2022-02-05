//  Import dart and flutter packages.
import 'package:flutter/material.dart';

class AnimationStatusNotification extends Notification {
  AnimationStatusNotification(
    this.animationStatus,
  );

  final AnimationStatus animationStatus;

  void prn() {
    print('AnimationStatusNotification, prn: animationStatus = $animationStatus');
  }
}