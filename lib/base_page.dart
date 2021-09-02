//  Import flutter packages.
import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    required this.title,
    Key? key,
  }) : super(key: key);

  /// [title] is the page title displayed on the appBar of the
  /// [BasePage] widget.
  final String title;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
