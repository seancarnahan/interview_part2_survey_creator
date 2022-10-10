import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyFolder.dart';
import 'package:interview_part2_survey_creator/providers/FolderProvider.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvDropdownIcon.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvDropdownConfig.dart';

class QuestionFolderTitle extends StatelessWidget {
  final FolderProvider folderProvider;
  const QuestionFolderTitle({Key? key, required this.folderProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Icon(
            folderProvider.isExpanded ? Icons.expand_more : Icons.chevron_right,
            size: 24,
            color: BrandedColors.black500,
          )
        ),
        Expanded(
          child: Text(
            folderProvider.folder.name,
            overflow: TextOverflow.ellipsis,
            style: BrandedTextStyle.b3Label(BrandedColors.black500)
          ),
        ),
        EnvDropdownIcon(
          config: EnvDropdownConfig(
            items: {
              'Rename': FolderActions.Rename,
              'Delete': FolderActions.Delete,
              'New Question': FolderActions.NewQuestion,
              'New Folder': FolderActions.NewFolder
            },
            onChanged: (itemType) {
              if (itemType == FolderActions.Rename) {
                folderProvider.updateIsUpdatingName(true);
              } else if (itemType == FolderActions.Delete) {
                SurveyProvider().deleteFolder(folderProvider.folder);
              } else if (itemType == FolderActions.NewQuestion) {
                folderProvider.addQuestion();
              } else if (itemType == FolderActions.NewFolder) {
                folderProvider.updateIsAddingFolder(true);
              }
            },
          ),
          icon: Icons.more_vert,
          size: 16,
        ),
      ],
    );
  }
}
