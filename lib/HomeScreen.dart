import 'package:flutter/material.dart';
import 'Add_new_task.dart';
import 'Dev_info.dart';
import 'Task_class.dart';
import 'Update_task.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  ThemeMode mode;
  Function callbackThemeChange;

  HomeScreen(
      {super.key, required this.mode, required this.callbackThemeChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List taskList = [];

  String dateFormats(date) {
    return DateFormat('hh:mm a    d/M/yy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DevInfo()));
          },
          icon: const Icon(Icons.error_outline),
        ),
        centerTitle: true,
        title: Text('Todos',
            style: GoogleFonts.notoSansAnatolianHieroglyphs(
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                widget.callbackThemeChange(widget.mode == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light);
              },
              icon: widget.mode == ThemeMode.light
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Task',
        shape: const RoundedRectangleBorder(),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              constraints: const BoxConstraints(minHeight: 100),
              context: context,
              builder: (context) {
                return AddNewTaskModal(
                  callbackAddTask: addTasktoList,
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12, left: 12, top: 13),
            child: Card(
              elevation: 9,
              child: ListTile(
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Actions'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return UpdateTaskModal(
                                            callbackUpdateTask:
                                                updateTasktoList,
                                            i: index,
                                            taskName: taskList[index].taskName,
                                          );
                                        });
                                  },
                                  leading: const Icon(Icons.edit),
                                  title: Text('Update',
                                      style: GoogleFonts
                                          .notoSansAnatolianHieroglyphs()),
                                ),
                                const Divider(
                                  height: 4,
                                ),
                                ListTile(
                                  onTap: () {
                                    deleteTasktoList(index);
                                    Navigator.pop(context);
                                  },
                                  leading: const Icon(Icons.delete),
                                  title: Text('Delete',
                                      style: GoogleFonts
                                          .notoSansAnatolianHieroglyphs()),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  leading: CircleAvatar(
                      child: Text('${index + 1}',
                          style: GoogleFonts.notoSansAnatolianHieroglyphs(
                              fontSize: 19))),
                  title: Text(
                    '${taskList[index].taskName}',
                    style: GoogleFonts.notoSansAnatolianHieroglyphs(
                        decoration: taskList[index].done
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 9, bottom: 4),
                    child: Text(
                      dateFormats(taskList[index].date),
                      style: GoogleFonts.roboto(fontSize: 11),
                    ),
                  ),
                  trailing: Checkbox(
                      activeColor: Colors.black,
                      value: taskList[index].done,
                      onChanged: (value) {
                        onChanged(index, taskList[index].done);
                      })
                  // trailing:  Text('Pending'),
                  ),
            ),
          );
        },
      ),
    );
  }

  addTasktoList(Task task) {
    setState(() {
      taskList.add(task);
    });
  }

  updateTasktoList(index, task) {
    setState(() {
      taskList[index].taskName = task;
    });
  }

  deleteTasktoList(index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  onChanged(int index, bool value) {
    setState(() {
      taskList[index].done = !taskList[index].done;
    });
  }
}
