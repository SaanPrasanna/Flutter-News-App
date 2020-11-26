import 'package:flutter/material.dart';
import 'package:newsapi/core/models/news.dart';
import 'package:newsapi/ui/views/details_view.dart';

import 'views/home_view.dart';

const String initialRoute = 'Home';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'details':
        var articles = settings.arguments as Articles;
        return MaterialPageRoute(
            builder: (_) => DetailsView(articles: articles));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
