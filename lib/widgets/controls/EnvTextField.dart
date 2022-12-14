import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/services/KeyboardService.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';

import 'models/EnvTextFieldConfig.dart';

class EnvTextField extends StatelessWidget {
  final EnvTextFieldConfig config;
  final ValueChanged<String>? onChanged;
  const EnvTextField({
    Key? key,
    required this.config,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle inputStyle = config.inputTextStyle ?? BrandedTextStyle.b3Label(BrandedColors.black500);
    return TextFormField(
      focusNode: config.focusNode,
      onChanged: onChanged,
      initialValue: config.initialText,
      inputFormatters: KeyboardService(
        config.keyboardType,
        config.additionalFormatter
      ).filteringTextInputFormatters,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: BrandedColors.primary500,
      cursorHeight: 20,
      autofocus: config.autoFocus,
      maxLength: config.maxLength,
      decoration: InputDecoration(
        filled: true,
        fillColor: config.color,
        prefixIcon: config.prefix != null ?
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: config.prefix,
          ) : null,
        counterText: '',
        hintText: config.hintText,
        hintStyle: inputStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            width: 0, 
            style: BorderStyle.none,
          ),
        ),
        isDense: true,
        isCollapsed: false,
      ),
      style: inputStyle,
    );
  }
}
