import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/providers/FolderProvider.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';
import 'package:interview_part2_survey_creator/styles/BrandedTextStyle.dart';
import 'package:interview_part2_survey_creator/widgets/controls/EnvTextField.dart';
import 'package:interview_part2_survey_creator/widgets/controls/models/EnvTextFieldConfig.dart';

class QuestionFolderRename extends StatefulWidget {
  final FolderProvider folderProvider;
  const QuestionFolderRename({Key? key, required this.folderProvider}) : super(key: key);

  @override
  State<QuestionFolderRename> createState() => _QuestionFolderRenameState();
}

class _QuestionFolderRenameState extends State<QuestionFolderRename> {
  String folderName = '';
  late FocusNode textFieldFocusNode;

  @override
  void initState() {
    super.initState();
    setState(() {
      folderName = widget.folderProvider.folder.name;
      textFieldFocusNode = FocusNode();  
    });
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
        if(!hasFocus) {
          if (folderName.isNotEmpty) {
            widget.folderProvider.rename(folderName);
          }
          widget.folderProvider.updateIsUpdatingName(false);
        }
      },
    );
  }
}
