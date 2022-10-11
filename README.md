# interview_part2_survey_creator

This project is tool created for an interview with Enveritas that allows users to Create and Edit custom Surveys.

https://www.figma.com/file/U7A2Kq0J7y7i7dz8E7dpAp/Enveritas---interview_survey_creator?node-id=0%3A1

## Getting Started
- Runs on broswers and ios sim (have not tried Android for this project, but should work there too)
- Versions: Flutter 3.3.0 and Dart 2.18.0
  - https://docs.flutter.dev/get-started/install
- "flutter run" from root of App

## Structure
- Majority of code is in /lib
- /ios, /macos, /web, /linux, /windows, /android are used for specific configuration options for their corresponding device(ex: controlling release versioning)
- /models -> Survey Object has a list of type SurveyQuestionable(abstract) which has 4 classes that implement it(text, boolean, number, multiple choice)
- /providers -> State Management: https://pub.dev/packages/provider
  - SurveyProvider -> has all the actions that can performed on a survey and updates is corresponding members with the changes
  - QuestionCreatorProvider -> is used to sync the state with question creator form and its corresponding preview
- /services -> Keyboard service is used for textfields(taken from previous app, but still my code)
- /widgets -> taken from previous side project and basic common components with Enveritas theming

## Disclaimers
- Used styling and assets from https://enveritas.org
- Have Lots of Room for improvement:
  - Widgets could be broken down more
  - Naming Conventions could have been more standardized and uniform
  - Would like to make "root" at least to extend FolderProvider and then break apart SurveyProvider states into their own state management
  - Could have made some Widgets like NewFolder More Reusable
  - SurveyProvider delete functionality is a mess
- Unfinished Functionality:
  - As a survey creator, I should be able to move existing questions and folders
  - When moving a folder, its contents should move with it and remain in the same order.
  - When moving a file or folder, I should be able to move it to a new target folder
  - When moving a file or folder, I should be able to move it to the "root" of a survey, outside of any particular folder.
  - As a survey creator, I should be able to easily locate any particular question within a survey.
  - Should be able to click on a question and edit it

- Majority of widgets in interview_survey_creator/widgets are from previous side project that I have written

## Flutter Doctor Summary:
<img width="520" alt="image" src="https://user-images.githubusercontent.com/29028698/193466472-2c982a87-ac30-48cb-9794-d15c61976c99.png">
