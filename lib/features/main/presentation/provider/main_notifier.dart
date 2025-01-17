import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../home/presentation/view/pages/home_page.dart';
import 'state/main_state.dart';

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier() : super(const MainState());
  List<Widget> mainPages = [
    const HomePage(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];
  double currentSize = 1;
  int mainNavBarIndex = 0;
  double scale = 1;
  double scale2 = 1;
  double scale3 = 1;
  double scale4 = 1;
  double scale5 = 1;

  changeMainScreen(int index) async {
    currentSize = changeScaleByIndex(index, 0);
    state = state.copyWith(scale: currentSize);
    await Future.delayed(const Duration(milliseconds: 400));
    currentSize = changeScaleByIndex(index, 1);
    mainNavBarIndex = index;
    state = state.copyWith(navBarIndex: index, scale: currentSize);
  }

  double changeScaleByIndex(int index, double value) {
    double scale1 = scale;
    switch (index) {
      case 0:
        scale = value;
        scale1 = scale;
      case 1:
        scale2 = value;
        scale1 = scale2;
      case 2:
        scale3 = value;
        scale1 = scale3;
      case 3:
        scale4 = value;
        scale1 = scale4;
      case 4:
        scale5 = value;
        scale1 = scale5;
      default:
    }
    return scale1;
  }
}
