// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key, 
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Slidable(
        endActionPane:ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction, 
              icon: Icons.delete, 
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15),
            )
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.yellow, 
            borderRadius: BorderRadius.circular(15),
            
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: 
                    isCompleted ? TextDecoration.lineThrough : TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
