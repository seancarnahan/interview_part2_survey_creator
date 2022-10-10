// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/SurveyFolder.dart';
import 'package:interview_part2_survey_creator/models/SurveyItemable.dart';
import 'package:interview_part2_survey_creator/providers/SurveyProvider.dart';

/*
 * ChangeNotifier(Provider):
 * This Provider provides access to controls on a Folder
 * Note: Can't have Singleton architecture here because we can expect multiple versions of this Provider
 */
class FolderProvider extends ChangeNotifier {
  SurveyFolder folder;
  bool isAddingFolder = false;
  bool isUpdatingName = false;
  bool isExpanded = false;

  FolderProvider(this.folder);

  void updateIsExpanded(bool isExpand) {
    isExpanded = isExpand;
    notifyListeners();
  }

  void updateIsUpdatingName(bool isUpdating) {
    isUpdatingName = isUpdating;
    notifyListeners();
  }

  void updateIsAddingFolder(bool isAdding) {
    isAddingFolder = isAdding;
    isExpanded = true;
    notifyListeners();
  }

  void addQuestion() {
    isExpanded = true;
    SurveyProvider().updateIsAddingQuestion(true, folder); //TODO: Refactor Providers should have separation of Concern
    notifyListeners();
  }

  void addFolder(SurveyFolder newFolder) {
    folder.items.add(newFolder);
    notifyListeners();
  }

  void rename(String newName) {
    folder.name = newName;
  }

  void deleteFolder(int index) {
    notifyListeners();
  }

  void reorderItems(int oldIndex, int newIndex) {
    List<SurveyItemable> items = folder.items;
    final SurveyItemable question = items.removeAt(oldIndex);
    items.insert(newIndex, question);
    notifyListeners();
  }
}
