// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';
import 'package:interview_part2_survey_creator/models/Survey.dart';
import 'package:interview_part2_survey_creator/models/SurveyFolder.dart';
import 'package:interview_part2_survey_creator/models/SurveyQuestionable.dart';

import '../models/SurveyItemable.dart';

/*
 * Singleton and ChangeNotifier(Provider):
 * This Service is used for once a survey is selected, then we can run certain functions on it
 * Using Singleton to avoid routing params and so I can access provider w/out consuming it
 * Otherwise accessing the Provider would have to have your widget also consume and be updated by it
 * From this Provider can add Question and Folder to root. But can only add a question to another folder
 */

// TODO: Move different states into separate providers -> too much control from a single provider
class SurveyProvider extends ChangeNotifier {
  Survey survey = Survey(items: []);
  SurveyQuestionable? selectedQuestion; // TODO: Create Separate Provider SelectedQuestionProvider
  bool isAddingQuestion = false;
  bool isAddingFolder = false;
  SurveyFolder? targetFolder;

  static final SurveyProvider _surveyProvider = SurveyProvider._internal();

  SurveyProvider._internal();

  factory SurveyProvider() {
    return _surveyProvider;
  }

  void updateSelectedQuestion(SurveyQuestionable? question) {
    selectedQuestion = question;
    notifyListeners();
  }

  // TODO: Make Root into its own Folder -> can save on a lot extra heavy work there
  void updateIsAddingFolderToRoot(bool isAdding, [SurveyFolder? folder]) {
    targetFolder = folder;
    if (isAdding == false) {
      _resetTargetFolder();
    }
    isAddingFolder = isAdding;
    notifyListeners();
  }

  // TODO: Make Root into its own Folder
  void updateIsAddingQuestion(bool isAdding, [SurveyFolder? folder]) {
    targetFolder = folder;
    if (isAdding == false) {
      _resetTargetFolder();
    } else {
      selectedQuestion = null;
    }
    isAddingQuestion = isAdding;
    notifyListeners();
  }

  void addQuestion(SurveyQuestionable question) {
    if (targetFolder != null) {
      targetFolder?.items.add(question);
    } else {
      survey.items.add(question);
    }
  }

  void addFolderToRoot(SurveyFolder folder) {
    if (targetFolder != null) {
      targetFolder?.items.add(folder);
    } else {
      survey.items.add(folder);
    }
  }

  void reorderItems(int oldIndex, int newIndex) {
    List<SurveyItemable> items = survey.items;
    final SurveyItemable question = items.removeAt(oldIndex);
    items.insert(newIndex, question);
    notifyListeners();
  }

  void _resetTargetFolder() {
    targetFolder = null;
  }

  /* Removals below -> couple of issues here -> I would call this section a Rough Draft */
  // TODO Refactor -> have to use a wrapper around the recursive function since Root isint a folder
  // TODO use Breaks or Return Types in depth first search for better runtime
  // TODO: also will need to make make copies of lists and loop over that, removing while looping is a big no no
  // Also: The code below is yucky looking
  void deleteFolder(SurveyFolder targetFolderForDelete) {
    for (var i = 0; i < survey.items.length; i++) {
      if (survey.items[i].runtimeType == SurveyFolder) {
        SurveyFolder folderItem = survey.items[i] as SurveyFolder;
        if (identical(targetFolderForDelete, folderItem)) {
          survey.items.removeAt(i);
        } else {
          _deleteFolderRecursive(targetFolderForDelete, folderItem);
        }
      }
    }
    notifyListeners();
  }

  void _deleteFolderRecursive(SurveyFolder targetFolderForDelete, SurveyFolder folder) {
    for (var i = 0; i < folder.items.length; i++) {
      if (folder.items[i].runtimeType == SurveyFolder) {
        SurveyFolder tempFolder = folder.items[i] as SurveyFolder;
        if (identical(targetFolderForDelete, tempFolder)) {
          folder.items.removeAt(i);
        } else {
          _deleteFolderRecursive(targetFolderForDelete, tempFolder);
        }
      }
    }
  }

  void deleteQuestion(SurveyQuestionable targetQuestion) {
    for (var i = 0; i < survey.items.length; i++) {
      if (identical(targetQuestion, survey.items[i])) {
        survey.items.removeAt(i);
      } else if (survey.items[i].runtimeType == SurveyFolder) {
        _deleteQuestionRecursive(targetQuestion, survey.items[i] as SurveyFolder);
      }
    }
    notifyListeners();
  }

  void _deleteQuestionRecursive(SurveyQuestionable targetQuestion, SurveyFolder folder) {
    for (var i = 0; i < folder.items.length; i++) {
      if (folder.items[i].runtimeType != SurveyFolder) {
        if (identical(targetQuestion, folder.items[i])) {
          folder.items.removeAt(i);
        }
      } else {
        _deleteQuestionRecursive(targetQuestion, folder.items[i] as SurveyFolder);
      }
    }
  }
}
