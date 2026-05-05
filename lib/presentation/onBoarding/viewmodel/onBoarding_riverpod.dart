import 'package:flutter_riverpod/legacy.dart';

class OnboardingRiverpod extends StateNotifier<int> {
  OnboardingRiverpod() : super(0);
  void setPage(int index) {
    state = index;
  }

  void nextPage(int length, void Function() onFinish) {
    if (state < length - 1) {
      state++;
    } else {
      onFinish();
    }
  }
}

final onBoardingProvider = StateNotifierProvider<OnboardingRiverpod, int>(
  (ref) => OnboardingRiverpod(),
);
