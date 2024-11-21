import 'package:flutter/material.dart';
import 'package:homei/features/auth/presentation/widgets/layout_widget.dart';
import 'package:homei/features/auth/presentation/screens/login_screen.dart';
import 'package:homei/features/auth/presentation/screens/signup_screen.dart';
import 'package:homei/features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/project_details/presentation/screens/project_screen.dart';

class AppRoutes {
  static const String projectDetails = '/project_details';
  static const String onboarding = '/onboarding';
  static const String signIn = '/sign_in';
  static const String signup = '/signup';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case projectDetails:
        return MaterialPageRoute(
          builder: (context) => ProjectDetailsScreen(),
        );

      case onboarding:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
          settings: RouteSettings(
            arguments: {
              'preventBack': true,
            }, // Pass a flag to prevent back
          ),
        );
      case signIn:
        return MaterialPageRoute(builder: (context) => SignInScreen());
        // final argument = settings.arguments as String;
        // Replace with your DetailScreen logic
        // return MaterialPageRoute(builder: (context) => DetailScreen(argument: argument));

        break;
      case signup:
        return MaterialPageRoute(
            builder: (context) => SignupScreen(),
            settings: RouteSettings(
              arguments: {
                'preventBack': true,
              }, // Pass a flag to prevent back
            ));

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
    return null;
  }
}
