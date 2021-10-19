//  Import flutter packages.
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPageContents extends StatefulWidget {
  const SettingsPageContents({Key? key}) : super(key: key);

  @override
  _SettingsPageContentsState createState() => _SettingsPageContentsState();
}

class _SettingsPageContentsState extends State<SettingsPageContents> {
  @override
  Widget build(BuildContext context) {
    return
      // ClipOval(
      // child:
      Container(
        // height: 200,
        // width: 200,
        color: Colors.red,
        child: ListView(
          padding: EdgeInsets.all(24),
          children: [
            SettingsGroup(
              title: 'General fIF;ODIF vj  ',
              children: <Widget>[
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
                SimpleSettingsTile(
                  title: 'test',
                  subtitle: '',
                  leading: Icon(Icons.delete),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      // ),
    );
  }
}
// child: ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: 100,
//   itemBuilder: (ctx, i) {
//     return Align(
//       child: Container(
//         width: 200,
//         height: 100,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.black,
//             width: 2
//           ),
//           borderRadius: BorderRadius.circular(32),
//           color: Colors.green.withOpacity(0.75)
//         ),
//       ),
//       widthFactor: 0.8,
//     );
//   },
// ),