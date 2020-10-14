import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/blocs/todolist/todo_list.dart';
import 'package:todo_app_bloc/repositories/todolist/todo_list_repository_impl.dart';
import 'package:todo_app_bloc/screens/todo_list_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        child: TodoListScreen(),
        create: (context) =>
            TodoListBloc(TodoListEmpty(), repository: TodoListRepositoryImpl()),
      ),
    );
  }
}
