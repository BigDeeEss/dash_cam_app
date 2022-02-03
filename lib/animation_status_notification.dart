//  Import dart and flutter packages.
import 'package:flutter/material.dart';

class AnimationStatusNotification extends Notification {
  AnimationStatusNotification(
    this.status,
  );

  final AnimationStatus status;
}