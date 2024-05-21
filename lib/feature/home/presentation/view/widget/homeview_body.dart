import 'package:flutter/material.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo.dart';
import 'package:todoapp/feature/home/presentation/modelview/fetch_todo_list/fetch_todo_list_cubit.dart';

import 'todo_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: FetchTodoListCubit.of(context).scrollController,
      itemCount: FetchTodoListCubit.of(context).todolist.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TodoItem(
              todoitem: FetchTodoListCubit.of(context).todolist[index]),
        );
      },
    );
  }
}
