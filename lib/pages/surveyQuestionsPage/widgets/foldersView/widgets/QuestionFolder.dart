import 'package:flutter/material.dart';
import 'package:interview_survey_creator_simple/models/SurveyFolder.dart';
import 'package:interview_survey_creator_simple/styles/BrandedColors.dart';
import 'package:interview_survey_creator_simple/styles/BrandedTextStyle.dart';
import 'package:interview_survey_creator_simple/widgets/button/EnvGestureDetector.dart';

// TODO: breakdown into smaller widgets
class QuestionFolder extends StatefulWidget {
  final SurveyFolder folder;
  const QuestionFolder({Key? key, required this.folder}) : super(key: key);

  @override
  State<QuestionFolder> createState() => _QuestionFolderState();
}

class _QuestionFolderState extends State<QuestionFolder> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Card(
            color: BrandedColors.secondary500,
            elevation: 0,
            margin: EdgeInsets.zero,
            child: InkWell(
              splashColor: BrandedColors.gray300,
              onTap:() => setState(() {
                isExpanded = !isExpanded;
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        isExpanded ? Icons.expand_more : Icons.chevron_right,
                        size: 16,
                        color: BrandedColors.black500,
                      )
                    ),
                    Expanded(
                      child: Text(
                        widget.folder.name,
                        overflow: TextOverflow.ellipsis,
                        style: BrandedTextStyle.b3Label(BrandedColors.black500)
                      ),
                    ),
                    EnvGestureDetector(
                      onTap: () => print('TODO: open action menu'),
                      child: const Icon(
                        Icons.more_vert,
                        color: BrandedColors.black500,
                        size: 16,
                      )
                    )
                  ],
                ),
              )
            ),
          )
        ),
        Visibility(
          visible: isExpanded,
          child: ReorderableListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.folder.items.length,
            buildDefaultDragHandles: false,
            onReorder: (int oldIndex, int newIndex) {
              print('Reorder has occured');
            },
            itemBuilder: (context, index) {
              return widget.folder.items[index].buildGroupItem();
            },
          )
        )
      ]
    );
  }
}
