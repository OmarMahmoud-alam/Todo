import 'package:flutter/material.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo.dart';
import 'package:popover/popover.dart';

import 'pop_up_menu.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todoitem,
  });
  final Todo todoitem;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(children: [
        Expanded(
            child: Text(
          todoitem.todo!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )),
        Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                showPopover(
                  context: context,
                  contentDyOffset: -21,
                  bodyBuilder: (context) => PopUpMenu(todoitem: todoitem),
                  // onPop: () => print('Popover was popped!'),
                  direction: PopoverDirection.bottom,
                  width: 140,
                  height: 130,
                  arrowHeight: 15,
                  arrowWidth: 30,
                );
              },
              icon: const Icon(Icons.menu));
        }),
      ]),
    );
  }
}
