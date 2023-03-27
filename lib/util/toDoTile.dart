import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  String toDoText;
  bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deletetask;

  ToDoTile(
      {super.key,
      required this.toDoText,
      required this.isCompleted,
      required this.onChanged,
      required this.deletetask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(children: [
          SlidableAction(
            onPressed: deletetask,
            icon: Icons.delete_sweep,
            borderRadius: BorderRadius.circular(12),
          )
        ], motion: StretchMotion()),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.purple),
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Checkbox(
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black),
              Text(
                toDoText,
                style: TextStyle(
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
