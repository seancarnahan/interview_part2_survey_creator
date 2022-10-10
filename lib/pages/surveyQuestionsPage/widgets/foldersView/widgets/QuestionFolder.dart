import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:interview_part2_survey_creator/models/SurveyFolder.dart';
import 'package:interview_part2_survey_creator/providers/FolderProvider.dart';
import 'package:interview_part2_survey_creator/styles/BrandedColors.dart';

import 'NewFolder.dart';
import 'QuestionFolderRename.dart';
import 'QuestionFolderTitle.dart';

// TODO: breakdown into smaller widgets
class QuestionFolder extends StatelessWidget {
  final int numIndents;
  final SurveyFolder folder;
  const QuestionFolder({Key? key, required this.folder, required this.numIndents}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FolderProvider(folder),
      child: Consumer<FolderProvider>(
        builder: (context, folderProvider, child) {
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
                    onTap:() => folderProvider.updateIsExpanded(!folderProvider.isExpanded),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: folderProvider.isUpdatingName ?
                        QuestionFolderRename(folderProvider: folderProvider) :
                        QuestionFolderTitle(folderProvider: folderProvider)
                    )
                  ),
                )
              ),
              Visibility(
                visible: folderProvider.isExpanded,
                child: ReorderableListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: folder.items.length,
                  buildDefaultDragHandles: false,
                  onReorder: (int oldIndex, int newIndex) {
                    int newIndexOffset = newIndex > oldIndex ? 1 : 0;
                    folderProvider.reorderItems(
                      oldIndex,
                      newIndex - newIndexOffset
                    );
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      key: ValueKey(folder.items[index]),
                      padding: EdgeInsets.only(left: 24.0 * numIndents),
                      child: ReorderableDragStartListener(
                        index: index,
                        child: folder.items[index].buildItem(numIndents + 1)
                      )
                    );
                  },
                )
              ),
              Visibility(
                visible: folderProvider.isAddingFolder,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0 * numIndents),
                  child: NewFolder(folderProvider: folderProvider),
                )
              )
            ]
          );
        }
      )
    );
  }
}
