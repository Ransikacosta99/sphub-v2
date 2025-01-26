import 'package:flutter/material.dart';

// Create a separate file for your custom button (e.g., custom_button.dart)
class CustomSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? elevation;

  const CustomSubmitButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ??
            Theme.of(context).primaryColor, // Default to primary color
        elevation: elevation,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: textColor ?? Colors.white, // Default to white
              fontSize: fontSize,
            ),
      ),
    );
  }
}
