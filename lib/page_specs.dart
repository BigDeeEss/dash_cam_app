
class PageSpec {
  const PageSpec({
    required this.title,
  });

  //  Page [title].
  final String title;
}

//  Home page button specs.
PageSpec homePage = PageSpec(
  title: 'Home',
);

//  Home page button specs.
PageSpec filesPage = PageSpec(
  title: 'Files',
);

//  Home page button specs.
PageSpec settingsPage = PageSpec(
  title: 'Settings',
);