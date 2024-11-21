import 'package:flutter/material.dart';
import 'package:homei/core/utils/color_palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.widget,
  });

  final void Function()? onPressed;
  final Widget ?widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: widget
    );
  }
}
