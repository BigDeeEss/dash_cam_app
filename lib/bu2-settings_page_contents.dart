//  Import flutter packages.
import 'package:flutter/material.dart';

//  Import project-specific files.
import 'package:dash_cam_app/notification_notifier.dart';

/// Implement a settings page based on a bespoke list view.
class SettingsPageContents extends StatelessWidget {
  SettingsPageContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Insert an instance of NotificationNotifier above
    //  _SettingsPageContentsList in order to trigger rebuild of list tiles.
    return NotificationNotifier<ScrollNotification, ScrollUpdateNotification>(
      child: _SettingsPageContentsList(),
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
        ValueListenableBuilder<dynamic>(
          valueListenable: NotificationNotifier.of(context).notificationData,
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
          valueListenable: NotificationNotifier.of(context).notificationData,
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


// class _SettingsPageContentsList extends StatefulWidget {
//   _SettingsPageContentsList({Key? key}) : super(key: key);
//
//   @override
//   State<_SettingsPageContentsList> createState() => __SettingsPageContentsListState();
// }
//
// class __SettingsPageContentsListState extends State<_SettingsPageContentsList> {
//   List<Color> colors = [
//     Colors.blueGrey,
//     Colors.green,
//     Colors.deepOrange,
//     Colors.purple
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         ValueListenableBuilder<dynamic>(
//           valueListenable: NotificationNotifier.of(context).notificationData,
//           builder: (BuildContext context, dynamic value, __,){
//             return Container(
//               height: value.toDouble() % 290 + 10,
//               width: 50,
//               alignment: Alignment.center,
//               color: colors[3],
//             );
//           },
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         ValueListenableBuilder<dynamic>(
//           valueListenable: NotificationNotifier.of(context).notificationData,
//           builder: (BuildContext context, dynamic value, __,){
//             return Container(
//               height: value.toDouble() % 290 + 10,
//               width: 50,
//               alignment: Alignment.center,
//               color: colors[3],
//             );
//           },
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[1],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[2],
//         ),
//         Container(
//           height: 50,
//           width: 50,
//           alignment: Alignment.center,
//           color: colors[0],
//         ),
//       ],
//     );
//   }
// }
