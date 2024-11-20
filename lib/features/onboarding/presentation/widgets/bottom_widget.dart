import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homei/core/localization/app_localizations.dart';
import 'package:homei/core/routes.dart';
import 'package:homei/core/utils/color_palette.dart';
import 'package:homei/features/onboarding/presentation/controllers/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget buildBottomNavigation(
    BuildContext context,
    int pageIndex,
    WidgetRef ref,
    PageController pageController, // Add PageController
    ) {
  final translate = AppLocalizations.of(context).translate;

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: Column(
      children: [
        // Page indicators
        SmoothPageIndicator(
          controller: pageController,
          count: 4,
          effect: ExpandingDotsEffect(
            dotWidth: 8.0,
            dotHeight: 8.0,
            expansionFactor: 4,
            spacing: 5.0,
            dotColor: AppColors.primary.withOpacity(0.3),
            activeDotColor: AppColors.primary,
          ),
        ),
        const SizedBox(height: 30),
        // Next/Get Started Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(

            onPressed: () {
              if (pageIndex < 3) {
                // Move to the next page
                ref.read(onboardingControllerProvider.notifier).nextPage();
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.lightText,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              fixedSize: const Size(double.maxFinite, 45),
            ),
            child: Text(pageIndex < 3 ? translate('next') : translate('get_started')),
          ),
        ),
      ],
    ),
  );
}
