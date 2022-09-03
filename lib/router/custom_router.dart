import 'package:flutter/material.dart';
import 'package:wird_book_app/pages/athkars_page.dart';
import 'package:wird_book_app/pages/all_wirds_page.dart';
import 'package:wird_book_app/pages/not_found_page.dart';
import 'package:wird_book_app/router/route_constants.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case athkarsRoute:
        return MaterialPageRoute(builder: (_) => const AthkarsPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
