import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:type_pi/helpers/extensions/on_context.dart';

class PlatformTextField extends StatefulWidget {
  const PlatformTextField({
    super.key,
    required this.obscureText,
    required this.enableSuggestions,
    required this.autocorrect,
    required this.placeholder,
    this.onSubmitted,
    this.onChanged,
    this.padding,
    this.value,
  });

  static const Color turquoise = Color(0xFF40E0D0);
  final String? value;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final String placeholder;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final EdgeInsets? padding;

  @override
  State<PlatformTextField> createState() => _PlatformTextFieldState();
}

class _PlatformTextFieldState extends State<PlatformTextField> {
  @override
  Widget build(BuildContext context) {
    bool isApple = Platform.isIOS || Platform.isMacOS;
    final TextEditingController controller = TextEditingController(
      text: widget.value,
    );

    if (isApple) {
      return CupertinoTextField(
        style: TextStyle(color: context.colorScheme.onBackground),
        onSubmitted: widget.onSubmitted,
        controller: controller,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        keyboardType: TextInputType.url,
        enableSuggestions: widget.enableSuggestions,
        autocorrect: widget.autocorrect,
        padding: widget.padding ?? const EdgeInsets.all(10),
        placeholder: widget.placeholder,
      );
    }

    return TextField(
      controller: controller,
      obscureText: widget.obscureText,
      enableSuggestions: widget.enableSuggestions,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.url,
      onSubmitted: widget.onSubmitted,
      autocorrect: widget.autocorrect,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        filled: true,
        fillColor: context.colorScheme.primary.withOpacity(0.0),
        border: const OutlineInputBorder(),
        contentPadding: widget.padding ?? const EdgeInsets.all(10),
      ),
    );
  }
}
