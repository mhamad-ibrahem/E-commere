import 'package:flutter/material.dart';
import 'sub_colors/gradient_colors.dart';
import 'sub_colors/grey_levels_color.dart';
import 'sub_colors/main_colors.dart';

class AppColors with MainColorsMixin, GradientColors, GreyLevelsColorMixin {
  static const Color primaryColor = Color(0xFFDB3022);
  static const Color secondaryColor = Color(0xff616161);
  static const Color yellow = Colors.amber;
}
