import 'package:flutter/material.dart';
import 'package:wcif_application/values/values.dart';

class Pill extends StatefulWidget {
  Pill({
    @required this.title,
    this.titleStyle,
    this.selectedTitleStyle,
    this.padding = const EdgeInsets.symmetric(
      horizontal: Sizes.PADDING_16,
      vertical: Sizes.PADDING_6,
    ),
    this.borderRadius = const BorderRadius.all(
      const Radius.circular(
        Sizes.RADIUS_24,
      ),
    ),
    this.border,
    this.selectedBackgroundColor = AppColors.greenblue3,
    this.unselectedBackgroundColor = AppColors.white,
    this.isSelected = false,
    this.isToggeled = true,
  });

  final String title;
  final TextStyle titleStyle;
  final TextStyle selectedTitleStyle;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final Border border;
  final Color unselectedBackgroundColor;
  final Color selectedBackgroundColor;
  final bool isSelected;
  final bool isToggeled ;
  @override
  _PillState createState() => _PillState();
}

class _PillState extends State<Pill> {
  bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle defaultTitleStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.grey2,
    );
    TextStyle defaultSelectedTitleStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.yellow,
    );
    return InkWell(
      onTap: widget.isToggeled ? () => _onPillTap() : ()=>{},
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: isSelected
              ? widget.selectedBackgroundColor
              : widget.unselectedBackgroundColor,
          borderRadius: widget.borderRadius,
          border: _toggleBorder(false),
        ),
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: isSelected
              ? (widget.selectedTitleStyle ?? defaultSelectedTitleStyle)
              : (widget.titleStyle ?? defaultTitleStyle),
        ),
      ),
    );
  }

  void _onPillTap() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Border _toggleBorder(bool state) {
    Border noBorder = Border.all(
      color: Colors.transparent,
      width: Sizes.WIDTH_2,
    );
    if (widget.border != null) {
      return state ? noBorder : widget.border;
    }
    return state
        ? noBorder
        : Border.all(
      color: AppColors.grey2,
      width: Sizes.WIDTH_2,
    );
  }
}