import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http_request/screen/gallery_screen.dart';
import 'package:http_request/screen/home_screen.dart';

class RouteGenerator {
  static Route onGrenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          builder: (context) => HomeScreen(),
        );
        break;
      case '/gallery':
        return CupertinoPageRoute(
          builder: (context) => GalleryScreen(),
        );
        break;
      default:
        return CupertinoPageRoute(
          builder: (context) => HomeScreen(),
        );
    }
  }
}
