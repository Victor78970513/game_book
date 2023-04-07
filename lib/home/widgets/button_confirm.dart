import 'package:flutter/material.dart';
import 'package:game_book/constants.dart';

class ButtonConfirm extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Widget? icon;
  final Color color;
  final double width;
  final TextStyle? style;
  const ButtonConfirm(
      {Key? key,
      this.onPressed,
      required this.label,
      this.color = primaryColor,
      this.icon,
      this.width = 200,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color?>(color),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.all(0)),
      ),
      onPressed: onPressed,
      child: Container(
          padding: const EdgeInsets.all(10),
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (icon != null) icon!,
              Text(label, style: style ?? const TextStyle(color: fontColor)),
            ],
          )),
    );
  }
}
