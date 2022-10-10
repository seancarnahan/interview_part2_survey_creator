import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyFolder.dart';
import 'package:interview_part2_survey_creator/providers/FolderProvider.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvTextField.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvTextFieldConfig.dart';

class NewFolder extends StatefulWidget {
  final SurveyProvider? surveyProvider;
  final FolderProvider? folderProvider;
  const NewFolder({
    Key? key,
    this.surveyProvider,
    this.folderProvider
  }) : super(key: key);

  @override
  State<NewFolder> createState() => _NewFolderState();
}

class _NewFolderState extends State<NewFolder> {
  String folderName = '';
  late FocusNode textFieldFocusNode;

  @override
  void initState() {
    super.initState();
    textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textFieldFocusNode.requestFocus();
    return Focus(
      autofocus: true,
      child: EnvTextField(
        config: EnvTextFieldConfig(
          hintText: 'Folder name...',
          autoFocus: true,
          maxLength: 20,
          initialText: folderName,
          inputTextStyle: BrandedTextStyle.b3Label(BrandedColors.primary500),
          focusNode: textFieldFocusNode
        ),
        onChanged: (value) => setState(() {
          folderName = value;
        }),
      ),
      onFocusChange: (hasFocus) {
        bool addToRoot = widget.surveyProvider != null;
        // TODO: Refactor -> This could be a lot cleaner
        if(!hasFocus) {
          if (addToRoot) {
            if (folderName.isNotEmpty) {
              widget.surveyProvider?.addFolderToRoot(SurveyFolder(folderName, []));
            }
            widget.surveyProvider?.updateIsAddingFolderToRoot(false);
          } else {
            if (folderName.isNotEmpty) {
              widget.folderProvider?.addFolder(SurveyFolder(folderName, []));
            }
            widget.folderProvider?.updateIsAddingFolder(false);
          }
        }
      },
    );
  }
}
