import 'package:flutter/material.dart';
import 'package:wcif_application/values/values.dart';

import '../layout/empty.dart';

class CustomTextFormField extends StatelessWidget {
  final TextStyle textFormFieldStyle;
  final TextStyle fieldTitleTextStyle;
  final TextStyle hintTextStyle;
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final String prefixIconImagePath;
  final String hintText;
  final Color prefixIconColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color fillColor;
  final bool filled;
  final bool obscured;
  final bool hasPrefixIcon;
  final bool hasSuffixIcon;
  final Widget suffixIcon;
  final int maxLines;
  final bool hasTitle;
  final String fieldTitle;
  final TextEditingController controller;

  CustomTextFormField({
    this.hasPrefixIcon = false,
    this.prefixIconImagePath,
    this.maxLines,
    this.textFormFieldStyle,
    this.fieldTitleTextStyle,
    this.hintTextStyle,
    this.borderStyle = BorderStyle.none,
    this.borderRadius = Sizes.RADIUS_6,
    this.borderWidth = Sizes.WIDTH_0,
    this.contentPaddingHorizontal = Sizes.PADDING_16,
    this.contentPaddingVertical = Sizes.PADDING_16,
    this.hintText,
    this.prefixIconColor = AppColors.greenblue2,
    this.borderColor = AppColors.grey,
    this.focusedBorderColor = AppColors.grey,
    this.enabledBorderColor = AppColors.grey,
    this.fillColor = AppColors.white,
    this.filled = true,
    this.obscured = false,
    this.hasTitle = false,
    this.suffixIcon,
    this.hasSuffixIcon = false,
    this.fieldTitle,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle titleTextStyle = theme.textTheme.subtitle1;
    TextStyle formTextStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.greenblue,
    );
    TextStyle formHintTextStyle = theme.textTheme.bodyText2.copyWith(
      color: AppColors.grey,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          hasTitle
              ? formFieldTitle(
              fieldTitle: fieldTitle,
              textStyle: fieldTitleTextStyle ?? titleTextStyle)
              : Empty(),
          TextFormField(
            style: textFormFieldStyle ?? formTextStyle,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: borderColor,
                  width: borderWidth,
                  style: borderStyle,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: enabledBorderColor,
                  width: borderWidth,
                  style: borderStyle,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: focusedBorderColor,
                  width: borderWidth,
                  style: borderStyle,
                ),
              ),
              suffixIcon: hasSuffixIcon ? suffixIcon : null,
              prefixIcon: hasPrefixIcon
                  ? ImageIcon(
                AssetImage(prefixIconImagePath),
                color: prefixIconColor,
              )
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: contentPaddingHorizontal,
                vertical: contentPaddingVertical,
              ),
              hintText: hintText,
              hintStyle: hintTextStyle ?? formHintTextStyle,
              filled: filled,
              fillColor: fillColor,
            ),
            obscureText: obscured,
          ),
        ],
      ),
    );
  }

  Widget formFieldTitle({@required String fieldTitle, TextStyle textStyle}) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.MARGIN_8),
      child: Text(
        fieldTitle,
        style: textStyle,
      ),
    );
  }
}
