import 'package:hive_flutter/hive_flutter.dart';

class Quiz {
  final int id;
  final String by;
  final String asset;
  final String date;
  final String question;
  List<Comment> comments;

  Quiz({
    required this.id,
    required this.by,
    required this.asset,
    required this.date,
    required this.question,
    required this.comments,
  });
}

@HiveType(typeId: 1)
class Comment {
  @HiveField(0)
  final int quizID;
  @HiveField(1)
  final String by;
  @HiveField(2)
  final String asset;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String title;
  @HiveField(5)
  final bool current;

  Comment({
    required this.quizID,
    required this.by,
    required this.asset,
    required this.date,
    required this.title,
    required this.current,
  });
}

class CommentAdapter extends TypeAdapter<Comment> {
  @override
  final typeId = 1;

  @override
  Comment read(BinaryReader reader) {
    return Comment(
      quizID: reader.read(),
      by: reader.read(),
      asset: reader.read(),
      date: reader.read(),
      title: reader.read(),
      current: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Comment obj) {
    writer.write(obj.quizID);
    writer.write(obj.by);
    writer.write(obj.asset);
    writer.write(obj.date);
    writer.write(obj.title);
    writer.write(obj.current);
  }
}

List<Quiz> quizesListModel = [
  Quiz(
    id: 1,
    by: 'Emily Thompson',
    asset: 'user2',
    date: 'May 13, 2024',
    question:
        'What problems or inconveniences are you experiencing when using the current version of the application?',
    comments: [],
  ),
  Quiz(
    id: 2,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 14, 2024',
    question: 'Which features do you find most useful in the app, and why?',
    comments: [],
  ),
  Quiz(
    id: 3,
    by: 'Sophia Lewis',
    asset: 'user3',
    date: 'May 16, 2024',
    question:
        'Are there any features that you rarely or never use? Why do you find them unhelpful?',
    comments: [],
  ),
  Quiz(
    id: 4,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 18, 2024',
    question:
        'How easy is it to navigate through the app and find what you need?',
    comments: [],
  ),
  Quiz(
    id: 5,
    by: 'Sophia Lewis',
    asset: 'user3',
    date: 'May 18, 2024',
    question:
        'Have you encountered any bugs or crashes while using the app? If so, please describe them.',
    comments: [],
  ),
  Quiz(
    id: 6,
    by: 'Emily Thompson',
    asset: 'user2',
    date: 'May 19, 2024',
    question:
        'How would you rate the overall performance of the app (e.g., speed, responsiveness)?',
    comments: [],
  ),
  Quiz(
    id: 7,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 20, 2024',
    question: 'Are there any features or functionalities you wish the app had?',
    comments: [],
  ),
  Quiz(
    id: 8,
    by: 'Sophia Lewis',
    asset: 'user3',
    date: 'May 21, 2024',
    question: 'How satisfied are you with the app’s user interface and design?',
    comments: [],
  ),
  Quiz(
    id: 9,
    by: 'Emily Thompson',
    asset: 'user2',
    date: 'May 21, 2024',
    question: 'Do you find the app’s notifications helpful or intrusive?',
    comments: [],
  ),
  Quiz(
    id: 10,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 22, 2024',
    question: 'How often do you use the app, and for what primary purpose?',
    comments: [],
  ),
  Quiz(
    id: 11,
    by: 'Sophia Lewis',
    asset: 'user3',
    date: 'May 22, 2024',
    question: 'How likely are you to recommend this app to others, and why?',
    comments: [],
  ),
  Quiz(
    id: 12,
    by: 'Ethan Mitchell',
    asset: 'user1',
    date: 'May 23, 2024',
    question:
        'What improvements would you suggest to enhance your experience with the app?',
    comments: [],
  ),
];

List<Comment> commentsListModel = [
  Comment(
    quizID: 1,
    by: 'Jacob Ramirez',
    asset: 'user2',
    date: 'May 20, 2024',
    title:
        'The app sometimes miscategorizes my expenses, making it hard to keep track.',
    current: false,
  ),
  Comment(
    quizID: 1,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 21, 2024',
    title:
        'The automatic expense categorization is incredibly useful for saving time.',
    current: false,
  ),
  Comment(
    quizID: 2,
    by: 'Mia Harris',
    asset: 'user3',
    date: 'May 21, 2024',
    title:
        'I find the expense tracking feature most useful as it allows me to log my spending immediately and accurately.',
    current: false,
  ),
  Comment(
    quizID: 3,
    by: 'Alexander Scott',
    asset: 'user3',
    date: 'May 22, 2024',
    title: 'Some users may not need to read news',
    current: false,
  ),
  Comment(
    quizID: 3,
    by: 'Mia Harris',
    asset: 'user3',
    date: 'May 23, 2024',
    title:
        'Users who are always connected to the internet may not see the value in offline access',
    current: false,
  ),
  Comment(
    quizID: 3,
    by: 'Daniel White',
    asset: 'user3',
    date: 'May 24, 2024',
    title:
        'Some users might be satisfied with the default design and not explore customization options.',
    current: false,
  ),
  Comment(
    quizID: 4,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 25, 2024',
    title:
        'The search function is efficient and helps quickly locate transactions, categories, and reports.',
    current: false,
  ),
  Comment(
    quizID: 4,
    by: 'Jacob Ramirez',
    asset: 'user3',
    date: 'May 25, 2024',
    title:
        'The app has a well-organized structure with clear menus and labels, making it simple to find specific features.',
    current: false,
  ),
  Comment(
    quizID: 5,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 25, 2024',
    title:
        'Sometimes, the app freezes or becomes unresponsive when switching between different screens too quickly.',
    current: false,
  ),
  Comment(
    quizID: 6,
    by: 'Jacob Ramirez',
    asset: 'user3',
    date: 'May 26, 2024',
    title:
        'The app loads quickly, and navigating between screens is smooth and seamless.',
    current: false,
  ),
  Comment(
    quizID: 7,
    by: 'Mia Harris',
    asset: 'user3',
    date: 'May 27, 2024',
    title:
        'Integration for tracking investments, stocks, and other assets alongside regular expenses and incomes.',
    current: false,
  ),
  Comment(
    quizID: 7,
    by: 'James Walker',
    asset: 'user3',
    date: 'May 28, 2024',
    title:
        'A feature to split expenses among multiple users or categories, useful for shared bills or group activities.',
    current: false,
  ),
  Comment(
    quizID: 8,
    by: 'Michael Edwards',
    asset: 'user3',
    date: 'May 29, 2024',
    title:
        'The user interface is minimalistic, reducing clutter and focusing on essential information.',
    current: false,
  ),
  Comment(
    quizID: 8,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 29, 2024',
    title:
        'The design elements, such as spacing and alignment, are well-executed, contributing to a polished look and feel.',
    current: false,
  ),
  Comment(
    quizID: 9,
    by: 'Daniel White',
    asset: 'user3',
    date: 'May 30, 2024',
    title:
        'Reminders for updating financial goals and budgets are useful for keeping my financial planning on track.',
    current: false,
  ),
  Comment(
    quizID: 9,
    by: 'Mia Harris',
    asset: 'user3',
    date: 'May 31, 2024',
    title:
        'The notifications for upcoming bills help me stay on top of my payments and avoid late fees.',
    current: false,
  ),
  Comment(
    quizID: 10,
    by: 'Mia Harris',
    asset: 'user3',
    date: 'May 31, 2024',
    title:
        'To check and compare daily expenses against the highest income value for better financial insights.',
    current: false,
  ),
  Comment(
    quizID: 10,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 31, 2024',
    title:
        'To update financial goals and categories, making sure the app reflects any changes in financial plans or priorities.',
    current: false,
  ),
  Comment(
    quizID: 11,
    by: 'Sophia Lewis',
    asset: 'user3',
    date: 'May 31, 2024',
    title:
        'The budgeting tools are effective in helping users set and achieve financial goals.',
    current: false,
  ),
  Comment(
    quizID: 11,
    by: 'Daniel White',
    asset: 'user3',
    date: 'May 31, 2024',
    title:
        'The app provides a seamless and intuitive user experience, making it easy to track expenses and incomes.',
    current: false,
  ),
  Comment(
    quizID: 12,
    by: 'Olivia Parker',
    asset: 'user3',
    date: 'May 31, 2024',
    title:
        'Implement a clean, modern, and intuitive user interface that is easy to navigate, with clear visual hierarchies and user-friendly icons and buttons.',
    current: false,
  ),
];
