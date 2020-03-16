/**
 * @author solox
 * @time 2020/3/13 0013-11:57
 * @theme_utils.dart
 * @desc：
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basics/res/resouce.dart';

class ThemeUtils {
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getDarkColor(BuildContext context, Color darkColor) {
    return isDark(context) ? darkColor : null;
  }

  static Color getIconColor(BuildContext context) {
    return isDark(context) ? CommonColours.text_dark : null;
  }

  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).scaffoldBackgroundColor;
  }

  static Color getDialogBackgroundColor(BuildContext context) {
    return Theme.of(context).canvasColor;
  }

  static Color getStickyHeaderColor(BuildContext context) {
    return isDark(context) ? CommonColours.text_normal : CommonColours.text_gray;
  }

  static Color getDialogTextFieldColor(BuildContext context) {
    return isDark(context) ? CommonColours.text_dark : CommonColours.text_gray;
  }

  static Color getKeyboardActionsColor(BuildContext context) {
    return isDark(context) ? CommonColours.text_dark : Colors.grey[200];
  }
}
