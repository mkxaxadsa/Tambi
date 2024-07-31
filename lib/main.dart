import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/router.dart';
import 'core/config/themes.dart';
import 'core/models/operation.dart';
import 'core/models/quiz.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/operation/bloc/operation_bloc.dart';
import 'features/quiz/bloc/quiz_bloc.dart';
import 'features/settings/bloc/settings_bloc.dart';

void main() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('commentsbox');
  Hive.registerAdapter(OperationAdapter());
  Hive.registerAdapter(CommentAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => SettingsBloc()),
        BlocProvider(create: (context) => OperationBloc()),
        BlocProvider(create: (context) => QuizBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
