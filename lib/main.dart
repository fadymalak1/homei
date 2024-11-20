import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/locale_controller.dart';
import 'core/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/utils/color_palette.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context).translate('welcome'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.onboarding,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
