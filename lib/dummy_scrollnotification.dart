//  Import flutter packages.
import 'package:flutter/material.dart';


class DummyScrollNotification extends ScrollNotification {
  DummyScrollNotification({
    required metrics,
    required context,
  })  : super(metrics: metrics, context: context);
}