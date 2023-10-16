import 'package:coffee_ecommerse/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.white,
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  );
}
