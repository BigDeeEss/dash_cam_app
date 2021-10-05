//  Import flutter packages.
import 'package:flutter/material.dart';

// Import project-specific files.
import 'package:dash_cam_app/settings_page_contents.dart';

class PageSpec {
  const PageSpec({
    required this.title,
    required this.contents,
  });

  /// Page [title].
  final String title;

  /// Page [contents].
  final Widget contents;
}

//  Home page button specs.
PageSpec homePage = PageSpec(
  title: 'Home',
  contents: Container(),
);

//  Home page button specs.
PageSpec filesPage = PageSpec(
  title: 'Files',
  contents: Container(),
);

//  Home page button specs.
PageSpec settingsPage = PageSpec(
  title: 'Settings',
  contents: SettingsPageContents(key: UniqueKey())
);