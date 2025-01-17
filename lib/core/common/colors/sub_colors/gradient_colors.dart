import 'package:flutter/material.dart';

import '../app_colors.dart';


mixin GradientColors {
  //Gradient colors
  Gradient get greenGradient => const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          AppColors.primaryColor,
          Colors.white,
        ],
      );
}
