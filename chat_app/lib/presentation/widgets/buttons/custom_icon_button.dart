import 'package:flutter/material.dart';


class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? size;
  final void Function()? onPressed;
  const CustomIconButton({super.key, required this.icon, this.onPressed, this.size = 25});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon, size: size, color: Colors.grey));
  }
}