import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyItemable.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvDropdownIcon.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvDropdownConfig.dart';

class AddFolderOrFile extends StatelessWidget {
  const AddFolderOrFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        EnvDropdownIcon(
          config: EnvDropdownConfig(
            items: {
              'Create New Question': SurveyItemTypes.Question,
              'Create New Folder': SurveyItemTypes.Folder
            },
            onChanged: (itemType) {
              if (itemType == SurveyItemTypes.Question) {
                SurveyProvider().updateIsAddingQuestion(true);
              } else {
                SurveyProvider().updateIsAddingFolderToRoot(true);
              }
            },
          ),
          icon: Icons.add,
          size: 24,
        ),
        const SizedBox(width: 24),
      ],
    );
  }
}
