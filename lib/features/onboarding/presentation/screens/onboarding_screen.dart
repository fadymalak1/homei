import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homei/core/localization/app_localizations.dart';
import 'package:homei/core/localization/locale_controller.dart';
import 'package:homei/features/onboarding/presentation/widgets/bottom_widget.dart';

import '../../../../core/utils/color_palette.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends ConsumerWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(onboardingControllerProvider);

    final List<Map<String, dynamic>> onboardingScreens = [
      {
        'title': {'en': 'Welcome', 'ar': 'مرحبًا'},
        'description': {
          'en': 'Discover a world of opportunities with our app.',
          'ar': 'اكتشف عالمًا من الفرص مع تطبيقنا.'
        },
        'image': 'assets/images/onboarding1.png',
      },
      {
        'title': {'en': 'Stay Connected', 'ar': 'ابقَ على اتصال'},
        'description': {
          'en': 'Keep track of your progress and stay updated.',
          'ar': 'تابع تقدمك وابقَ على اطلاع دائم.'
        },
        'image': 'assets/images/onboarding2.png',
      },
      {
        'title': {'en': 'Explore Features', 'ar': 'استكشف الميزات'},
        'description': {
          'en': 'Learn about all the powerful features we offer.',
          'ar': 'تعرف على جميع الميزات القوية التي نقدمها.'
        },
        'image': 'assets/images/onboarding3.png',
      },
      {
        'title': {'en': 'Get Started', 'ar': 'ابدأ الآن'},
        'description': {
          'en': 'Join us today and start your journey with ease.',
          'ar': 'انضم إلينا اليوم وابدأ رحلتك بسهولة.'
        },
        'image': 'assets/images/onboarding4.png',
      },
    ];

    final translate = AppLocalizations.of(context).translate;
    final currentLocale = ref.watch(localeProvider);

    return WillPopScope(
      onWillPop: () async {
        // Disable back button
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextButton(onPressed: (){

            final newLocale =
            currentLocale.languageCode == 'en' ? const Locale('ar') : const Locale('en');
            ref.read(localeProvider.notifier).setLocale(newLocale);
          }, child: Text(currentLocale.languageCode == 'en' ?"العربية":"English",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primary),)),
          actions: [
            TextButton(
              onPressed: () {
                ref.read(onboardingControllerProvider.notifier).skipAll();
                _pageController.jumpToPage(3); // Skip directly to the last page
              },
              child: Text(translate('skip'), style: TextStyle(color: AppColors.greyText)),
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController, // Assign the PageController
                onPageChanged: (index) =>
                ref.read(onboardingControllerProvider.notifier).state = index,
                itemCount: onboardingScreens.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(onboardingScreens[index]['image'], height: 300),
                      Icon(Icons.cloud, size: 300, color: AppColors.primary),
                      SizedBox(height: 20),
                      Text(translate(onboardingScreens[index]['title'][currentLocale.languageCode]), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(translate(onboardingScreens[index]['description'][currentLocale.languageCode]), textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            buildBottomNavigation(context, pageIndex, ref, _pageController),
          ],
        ),
      ),
    );
  }
}
