import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tasks_app/blocs/export_bloc.dart';
import 'package:flutter_tasks_app/models/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.listTask,
  }) : super(key: key);

  final List<Task> listTask;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: listTask.length,
            itemBuilder: (context, index) {
              var task = listTask[index];
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  onChanged: (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  },
                  value: task.isDone,
                ),
              );
            }));
  }
}
