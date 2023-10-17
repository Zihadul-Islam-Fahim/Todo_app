import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateTaskModal extends StatefulWidget {
  final Function callbackUpdateTask;
  final int i;
  String taskName;

  UpdateTaskModal(
      {super.key,
      required this.callbackUpdateTask,
      required this.i,
      required this.taskName});

  @override
  State<UpdateTaskModal> createState() => _UpdateTaskModalState();
}

class _UpdateTaskModalState extends State<UpdateTaskModal> {
  late final TextEditingController _updateTEcontroller;

  @override
  void initState() {
    super.initState();
    _updateTEcontroller = TextEditingController(text: widget.taskName);
  }

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
              Text('Update Todo',
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
          TextFormField(
            controller: _updateTEcontroller,
            maxLines: 4,
            decoration: const InputDecoration(
                hintText: 'Enter your Todo here',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  widget.callbackUpdateTask(widget.i, _updateTEcontroller.text);
                  Navigator.pop(context);
                },
                child: const Text('Update'),
              ))
        ],
      ),
    );
  }
}
