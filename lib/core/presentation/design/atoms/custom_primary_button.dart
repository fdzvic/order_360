import 'package:flutter/material.dart';
import 'package:order_360/core/presentation/design/atoms/custom_text.dart';
import 'package:order_360/core/presentation/design/tokens/colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.buttonType = ButtonType.primary,
    this.icon,
    this.enabled = true,
    this.height,
    this.width,
    this.textColor,
    this.borderColor,
    this.isLoading = false,
  });

  final String text;
  final Function onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final ButtonType buttonType;
  final Widget? icon;
  final bool enabled;
  final double? height;
  final double? width;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButtonTheme(
      data: TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _getColor(buttonType == ButtonType.primary),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? _getColor(true)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        minimumSize: buttonType != ButtonType.back
            ? MaterialStateProperty.all(Size(width ?? 160, height ?? 48))
            : MaterialStateProperty.all(const Size(75, 36)),

        /// Color icon
        foregroundColor: MaterialStateProperty.all(
            _getColor(buttonType != ButtonType.primary)),
      )),
      child: TextButton(
          onPressed: enabled ? () => onPressed() : null,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: buttonType == ButtonType.back ? 8 : 16,
            ),
            child: Row(
              mainAxisAlignment: icon != null
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null && buttonType != ButtonType.back) ...[
                  Opacity(
                    opacity: buttonType != ButtonType.back ? 1 : 0,
                    child: icon!,
                  ),
                  const SizedBox(width: 14)
                ],
                CustomText(
                  text,
                  textColor: textColor ??
                      (enabled ? colors.cardColor : colors.blackLightActive),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                if (isLoading!) ...[
                  const SizedBox(width: 14),
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      backgroundColor: colors.blackLightActive,
                      strokeWidth: 2.5,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(colors.blackWhite),
                    ),
                  )
                ]
              ],
            ),
          )),
    );
  }

  _getColor(bool colored) {
    return colored
        ? backgroundColor ?? (enabled ? colors.blackDarker : colors.blackLight)
        : Colors.white;
  }
}

enum ButtonType { primary, secondary, back }
