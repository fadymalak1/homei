import 'package:flutter/material.dart';
import '../features/project/presentation/screens/project_screen.dart';

class AppRoutes {
  static const String project = '/project';
  static const String another = '/another';
  static const String detail = '/detail';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case project:
        return MaterialPageRoute(builder: (context) => ProjectDetailsScreen());
      case another:
        // return MaterialPageRoute(builder: (context) => const AnotherScreen());
      case detail:
        final argument = settings.arguments as String;
        // return MaterialPageRoute(
        //   builder: (context) => DetailScreen(argument: argument),
        // );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
