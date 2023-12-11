import 'package:chat_app/presentation/screens/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final bool autofocus;
  final String? initialValue;
  final Icon? outsideIcon;
  final bool enabled;
  final Icon? insideIcon;
  final int maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFormField({
    super.key,
    this.label,
    this.maxLength = 100,
    this.initialValue,
    this.outsideIcon,
    this.enabled = true,
    this.hint,
    this.controller,
    this.errorMessage,
    this.autofocus = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.onFieldSubmitted,
    this.insideIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final formzState = context.watch<ThemeBloc>().state;

    final borderFocus = OutlineInputBorder(borderSide: BorderSide(color: Colors.blue.shade600));
    const borderRadius = Radius.circular(15);

    final border = OutlineInputBorder(borderSide: BorderSide(color: (!formzState.isDarkMode) ? Colors.black38 : Colors.white38));

    return Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(topLeft: borderRadius, bottomRight: borderRadius),
        ),
        child: TextFormField(
          inputFormatters: const [],
          onChanged: onChanged,
          cursorColor: colors.primary,
          initialValue: initialValue,
          enabled: enabled,
          validator: validator,
          controller: controller,
          enableInteractiveSelection: false,
          autofocus: autofocus,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          maxLength: maxLength,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 20, color: (!formzState.isDarkMode) ? Colors.black : Colors.white),
          decoration: InputDecoration(
              floatingLabelStyle: TextStyle(color: colors.primary, fontWeight: FontWeight.bold, fontSize: 18),
              enabledBorder: border,
              suffixIcon: insideIcon,
              focusedBorder: borderFocus,
              errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade100)),
              focusedErrorBorder: border.copyWith(borderSide: const BorderSide(color: Colors.transparent)),
              isDense: true,
              label: label != null ? Text(label!) : null,
              hintText: hint,
              errorText: errorMessage,
              focusColor: colors.primary,
              icon: outsideIcon),
        ));
  }
}
