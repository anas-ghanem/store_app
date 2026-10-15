import 'package:flutter/material.dart';
import 'package:store_app/core/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final int maxLines;
  final String? initialValue;

  const CustomTextField({
    super.key,
    this.hintText,
    this.label,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.maxLines = 1,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              color: isDark
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          initialValue: controller == null ? initialValue : null,
          onChanged: onChanged,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: TextStyle(
            color: isDark ? AppColors.textDark : AppColors.textLight,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: AppColors.accent,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: AppColors.accent,
                    size: 20,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
