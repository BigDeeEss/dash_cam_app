//  Import flutter packages.
import 'package:flutter/material.dart';

//  Import project-specific files.
import 'package:dash_cam_app/notification_broadcaster.dart';


class ScrollNotificationBroadcaster extends InheritedWidget {
  ScrollNotificationBroadcaster({
    Key? key,
    required this.randNumValueNotifier,
    required this.child,
  }) : super(key: key, child: child);

  final ValueNotifier<dynamic> randNumValueNotifier;

  final Widget child;

  static ScrollNotificationBroadcaster of(BuildContext context) {
    final ScrollNotificationBroadcaster? result = context.dependOnInheritedWidgetOfExactType<ScrollNotificationBroadcaster>();
    assert(result != null, 'No ScrollNotificationBroadcaster found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ScrollNotificationBroadcaster old) =>
      randNumValueNotifier != old.randNumValueNotifier;
}


class SettingsPageContents extends StatelessWidget {
  SettingsPageContents({Key? key}) : super(key: key);

  ValueNotifier<double> scrollPositionNotifier = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return ScrollNotificationBroadcaster(
      randNumValueNotifier: scrollPositionNotifier,
      child: NotificationListener<ScrollNotification>(
        // onNotification : (notification) => setValueNotifier(notification),
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            // print('Top level listener...');
            // randNumValueNotifier.value = (randNum.nextInt(50) + 50);
            scrollPositionNotifier.value = notification.metrics.pixels;
            // print(randNumValueNotifier.value);
            print('SettingsPageContents: scroll position, '
                '${notification.metrics.pixels}');
          }
          return false;
        },
        // child: MyHomePage(),
        child: NotificationBroadcaster(
          child: MyHomePage(),
        ),
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
          valueListenable: ScrollNotificationBroadcaster.of(context).randNumValueNotifier,
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
        // ValueListenableBuilder<dynamic>(
        //   valueListenable: ScrollNotificationBroadcasterA.of(context).notifier,
        //   builder: (BuildContext context, dynamic value, __,){
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
