import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/task_model.dart';
import 'package:uuid/uuid.dart';

class CreateTaskArguments {
  final bool isEdit;

  final TaskModel taskModel;

  CreateTaskArguments({
    required this.isEdit,
    required this.taskModel,
  });
}

class CreateTaskManagement extends StatefulWidget {
  const CreateTaskManagement({
    super.key,
  });

  @override
  State<CreateTaskManagement> createState() => _CreateTaskManagementState();
}

class _CreateTaskManagementState extends State<CreateTaskManagement> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as CreateTaskArguments?;

    _controller.text = arguments?.taskModel.taskName ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${arguments?.isEdit == true ? "Edit" : "Create"} Task',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Masukan Kegiatan Hari Ini',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (arguments?.isEdit == true) {
                Navigator.pop(
                  context,
                  TaskModel(
                    id: arguments?.taskModel.id ?? "",
                    taskName: _controller.text,
                  ),
                );
              } else {
                Navigator.pop(
                  context,
                  TaskModel(
                    id: const Uuid().v1(),
                    taskName: _controller.text,
                  ),
                );
              }
            },
            child: Text(
              '${arguments?.isEdit == true ? "Edit" : "Create"} Task',
            ),
          )
        ],
      ),
    );
  }
}
