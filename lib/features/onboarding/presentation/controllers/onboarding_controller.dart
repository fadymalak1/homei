import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController extends StateNotifier<int> {
  OnboardingController() : super(0);

  void nextPage() {
    if (state < 2) state++;
  }

  void skipAll() {
    state = 2;
  }

  void previousPage() {
    if (state > 0) state--;
  }
}

final onboardingControllerProvider =
StateNotifierProvider<OnboardingController, int>(
      (ref) => OnboardingController(),
);
