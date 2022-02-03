//  Import flutter packages.
import 'dart:math' as math;
import 'package:flutter/material.dart';

//  Import project-specific files.
// import 'package:dash_cam_app/bu2-notification_notifier.dart';
import 'package:dash_cam_app/notification_notifier.dart';
import 'package:dash_cam_app/data_notifier.dart';
import 'package:dash_cam_app/nn.dart';
import 'package:dash_cam_app/settings_page_list_tile.dart';
// import 'package:dash_cam_app/settings_page_list_tile_clipper.dart';
// import 'package:dash_cam_app/devel/settings_page_listtile.dart';

/// Implement a settings page based on a bespoke list view.
class SettingsPageContents extends StatelessWidget {
  SettingsPageContents({Key? key}) : super(key: key);

  ValueNotifier<double> notificationData = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    //  Insert an instance of NotificationNotifier above
    //  _SettingsPageContentsList in order to trigger rebuild of list tiles.
    // return NotificationNotifier<ScrollNotification, ScrollUpdateNotification>(
    //   child: _SettingsPageContentsList(),
    // );
    return NN<ScrollNotification>(
      key: ValueKey('NN_test'),
      child: _SettingsPageContentsList(),
      data: notificationData,
      onNotification: (data) {
        return true;
      },
    );
  }
}

class _SettingsPageContentsList extends StatelessWidget {
  const _SettingsPageContentsList({Key? key}) : super(key: key);

  final List<Color> colors = const [
    Colors.blueGrey,
    Colors.green,
    Colors.deepOrange,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    // print(DataNotifier.of<double>(context, ValueKey('NN_test')).data.value);
    return
      // ClipPath(
      //   clipper: SettingsPageListTileClipper(
      //   context: context,
      // ),
      // child:
        ListView(
        children: [
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
          // SettingsPageListTile(
          //   valueListenable: NN.of(context, ValueKey('NN_test')),
          // ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            color: colors[0],
          ),
          Card(
            child: ListTile(
              title: Text("Codesinsider.com"),
            ),
            elevation: 8,
            shadowColor: Colors.green,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
          ),
          // ValueListenableBuilder<double>(
          //   valueListenable: NN.of(context, ValueKey('NN_test')).data,
          //   builder: (BuildContext context, double value, __,){
          //     return Container(
          //       // height: 20.0 + 40 * math.pow(math.cos(value/50), 2),
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
          ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            selected: true,
            selectedTileColor: Colors.grey[300],
            leading: FlutterLogo(),
            title: Text('ListTile'),
          ),
          Card(
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              selected: true,
              selectedTileColor: Colors.grey[300],
              leading: FlutterLogo(),
              title: Text('ListTile'),
              subtitle: SizedBox(height: 77,),
            ),
          ),
          // SettingsPageListTile(
          //   valueListenable: NotificationNotifier.of <ScrollNotification> (context).notificationData,
          // ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            color: colors[1],
          ),
          Card(
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              color: colors[2],
              child: Text('2'),
            ),
          ),
          Card(
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              color: colors[2],
              child: Text('1'),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            color: colors[2],
          ),
          // SettingsPageListTile(
          //   valueListenable: NotificationNotifier.of <ScrollNotification> (context).notificationData,
          // ),
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
          Card(
            child: Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              color: colors[2],
            ),
          ),
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            color: colors[0],
          ),
          // ValueListenableBuilder<double>(
          //   valueListenable: NotificationNotifier.of<ScrollNotification>(context).notificationData,
          //   builder: (BuildContext context, double value, __,){
          //     return Container(
          //       height: 20.0 + 40 * math.pow(math.cos(value/50), 2),
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
      // ),
    );
  }
}