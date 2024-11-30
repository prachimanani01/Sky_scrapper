import 'package:flutter/cupertino.dart';

import 'package:weatherapp/view/detailspage.dart';
import 'package:weatherapp/view/homepage.dart';
import 'package:weatherapp/view/splashscreen.dart';

class Routes {
  static String splash_screen = '/';
  static String home_page = 'home_page';
  static String details_page = 'details_page';

  static Map<String, WidgetBuilder> myRoutes = {
    splash_screen: (context) => const Splashscreen(),
    home_page: (context) => const Homepage(),
    details_page: (context) => const DetailsPage(),
  };
}
