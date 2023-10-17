import 'package:flutter/material.dart';
import 'package:todo_app/Task_class.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewTaskModal extends StatefulWidget {
  final Function(Task) callbackAddTask;

  const AddNewTaskModal({
    super.key,
    required this.callbackAddTask,
  });

  @override
  State<AddNewTaskModal> createState() => _AddNewTaskModalState();
}

class _AddNewTaskModalState extends State<AddNewTaskModal> {
  final TextEditingController _taskTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 12,
          right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add New Todo',
                  style:
                      GoogleFonts.notoSansAnatolianHieroglyphs(fontSize: 27)),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return 'Task Required';
                }
                return null;
              },
              controller: _taskTEController,
              maxLines: 2,
              decoration: const InputDecoration(
                  hintText: 'Enter your Todo here',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Task tasks = Task(
                          taskName: _taskTEController.text.trim(),
                          date: DateTime.now(),
                          done: false);
                      widget.callbackAddTask(tasks);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Add')))
        ],
      ),
    );
  }
}
