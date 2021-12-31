//  Import flutter packages.
import 'package:flutter/material.dart';

//  Import project-specific files.
import 'package:dash_cam_app/notification_broadcaster.dart';



class SettingsPageContents extends StatelessWidget {
  SettingsPageContents({Key? key}) : super(key: key);

  ValueNotifier<double> scrollPositionNotifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return NotificationBroadcaster(
      notifier: scrollPositionNotifier,
      child: NotificationListener<ScrollNotification>(
        // onNotification : (notification) => setValueNotifier(notification),
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            // print('Top level listener...');
            // notifier.value = (randNum.nextInt(50) + 50);
            scrollPositionNotifier.value = notification.metrics.pixels;
            // print(notifier.value);
            print('SettingsPageContents: scroll position, '
                '${notification.metrics.pixels}');
          }
          return false;
        },
        child: MyHomePage(),
        // child: NotificationBroadcaster<ScrollNotification, ScrollUpdateNotification>(
        //   child: MyHomePage(),
        // ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> colors = [
    Colors.blueGrey,
    Colors.green,
    Colors.deepOrange,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        ValueListenableBuilder<dynamic>(
          valueListenable: NotificationBroadcasterService.of(context).notifier,
          builder: (BuildContext context, dynamic value, __,){
            return Container(
              height: value.toDouble() % 290 + 10,
              width: 50,
              alignment: Alignment.center,
              color: colors[3],
            );
          },
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        // ValueListenableBuilder<double>(
        //   valueListenable: NotificationBroadcasterService.of(context).notifier,
        //   builder: (BuildContext context, double value, __,){
        //     return Container(
        //       height: value.toDouble() % 290 + 10,
        //       width: 50,
        //       alignment: Alignment.center,
        //       color: colors[3],
        //     );
        //   },
        // ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[1],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[2],
        ),
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          color: colors[0],
        ),
      ],
    );
  }
}
