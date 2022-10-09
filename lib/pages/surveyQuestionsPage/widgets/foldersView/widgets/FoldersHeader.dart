import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/widgets/controls/EnvTextField.dart';
import 'package:interview_survey_creator_simple/widgets/controls/models/EnvTextFieldConfig.dart';
import 'package:interview_survey_creator_simple/services/KeyboardService.dart';

class FoldersHeader extends StatelessWidget {
  const FoldersHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 48),
        const Padding(
          padding: EdgeInsets.only(left: 48),
          child: Image(
            width: 168,
            height: 32,
            image: AssetImage('EnveritasLogoSecondary.png')
          ),
        ),
        const SizedBox(height: 52),
        // TODO implement Search functionality
        Container(
          margin: const EdgeInsets.only(left: 24, right: 32),
          child: EnvTextField(
            config: EnvTextFieldConfig(
              prefix: const Icon(Icons.search, size: 32, color: BrandedColors.primary500),
              hintText: 'Find a Question...',
              keyboardType: KeyboardType.charsAndNumbersAndSpaces,
              color: BrandedColors.white500
            ),
          ),
        ),
        const SizedBox(height: 52),
        const Divider(
          height: 1,
          color: BrandedColors.gray300
        )
      ],
    );
  }
}
