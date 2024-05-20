import 'package:flutter/material.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo.dart';
import 'package:todoapp/feature/home/presentation/view/widget/todo_item.dart';

import 'popup_rowitem.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({
    super.key,
    required this.todoitem,
  });
  final Todo todoitem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0, left: 22.0, right: 22),
      child: Column(
        children: [
          PopupRowitem(
            title: 'delete',
          ),
          PopupRowitem(
            title: 'changestates',
          ),
          PopupRowitem(
            title: 'التقييم',
            //   onTap: () =>,
          )
        ],
      ),
    );
  }
}
