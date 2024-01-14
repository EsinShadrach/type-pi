import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:type_pi/helpers/extensions/on_context.dart';

class PlatformTextField extends StatelessWidget {
  const PlatformTextField({
    super.key,
    required this.controller,
    required this.obsureText,
    required this.enableSuggestions,
    required this.autocorrect,
    required this.placeholder,
    this.onSubmitted,
    this.onChanged,
    this.padding,
  });

  static const Color turquoise = Color(0xFF40E0D0);
  final TextEditingController controller;
  final bool obsureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final String placeholder;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    bool isApple = Platform.isIOS || Platform.isMacOS;

    if (isApple) {
      return CupertinoTextField(
        style: TextStyle(color: context.colorScheme.onBackground),
        onSubmitted: onSubmitted,
        controller: controller,
        onChanged: onSubmitted,
        obscureText: obsureText,
        keyboardType: TextInputType.url,
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        padding: padding ?? const EdgeInsets.all(10),
        placeholder: placeholder,
      );
    }

    return TextField(
      controller: controller,
      obscureText: obsureText,
      enableSuggestions: enableSuggestions,
      onChanged: onSubmitted,
      keyboardType: TextInputType.url,
      onSubmitted: onSubmitted,
      autocorrect: autocorrect,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: context.colorScheme.primary.withOpacity(0.0),
        border: const OutlineInputBorder(),
        contentPadding: padding ?? const EdgeInsets.all(10),
      ),
    );
  }
}
