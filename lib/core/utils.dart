import 'dart:developer';
import 'dart:ui';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/operation.dart';
import 'models/quiz.dart';

String firstName = 'User';
String lastName = '';
bool genderMale = true;
String imagePath = '';
int myIncomes = 0;
int myExpenses = 0;

// SHARED PREFS
Future<void> getData() async {
  final prefs = await SharedPreferences.getInstance();
  firstName = prefs.getString('firstName') ?? 'User';
  lastName = prefs.getString('lastName') ?? '';
  genderMale = prefs.getBool('genderMale') ?? true;
  imagePath = prefs.getString('imagePath') ?? '';
}

Future<void> saveUser(String name, String surname, bool male) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('firstName', name);
  prefs.setString('lastName', surname);
  prefs.setBool('genderMale', male);
  firstName = name;
  lastName = surname;
  genderMale = male;
}

Future<void> saveImage(String path) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('imagePath', path);
  imagePath = path;
}

// HIVE
List<Operation> operationsList = [];

Future<List<Operation>> getModels() async {
  final box = await Hive.openBox('operationbox');
  List data = box.get('operationsList') ?? [];
  operationsList = data.cast<Operation>();
  log(operationsList.length.toString());
  getBalance();
  return operationsList;
}

Future<List<Operation>> updateModels() async {
  final box = await Hive.openBox('operationbox');
  box.put('operationsList', operationsList);
  operationsList = await box.get('operationsList');
  getBalance();
  return operationsList;
}

List<Comment> commentsList = [];

Future<List<Comment>> getComments() async {
  final box = await Hive.openBox('commentsbox');
  List data = box.get('commentsList') ?? commentsListModel;
  commentsList = data.cast<Comment>();
  log(commentsList.length.toString());
  sortComments();
  return commentsList;
}

Future<List<Comment>> updateComments() async {
  final box = await Hive.openBox('commentsbox');
  box.put('commentsList', commentsList);
  commentsList = await box.get('commentsList');
  sortComments();
  return commentsList;
}

void sortComments() {
  for (Quiz quiz in quizesListModel) {
    quiz.comments = [];
    for (Comment comment in commentsList) {
      if (comment.quizID == quiz.id) {
        quiz.comments.add(comment);
      }
    }
  }
}

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatDate() {
  DateTime now = DateTime.now();
  return DateFormat('MMMM d, yyyy').format(now);
}

void getBalance() {
  int incomes = 0;
  int expenses = 0;
  for (Operation operation in operationsList) {
    if (operation.income) {
      incomes = incomes + operation.amount;
    } else {
      expenses = expenses + operation.amount;
    }
  }
  myIncomes = incomes;
  myExpenses = expenses;
}

Future<XFile> pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return XFile('');
    return image;
  } catch (e) {
    log(e.toString());
    return XFile('');
  }
}

List<Operation> getList(int index) {
  log('GET LIST');
  List<Operation> incomes = [];
  List<Operation> expenses = [];
  if (index == 0) return operationsList;
  if (index == 1) {
    for (Operation operation in operationsList) {
      if (operation.income) incomes.add(operation);
    }
    return incomes;
  }
  if (index == 2) {
    for (Operation operation in operationsList) {
      if (!operation.income) expenses.add(operation);
    }
    return expenses;
  }
  return [];
}

Color invertColor(Color color) {
  int invertedRed = 255 - color.red;
  int invertedGreen = 255 - color.green;
  int invertedBlue = 255 - color.blue;
  return Color.fromARGB(
    color.alpha,
    invertedRed,
    invertedGreen,
    invertedBlue,
  );
}
