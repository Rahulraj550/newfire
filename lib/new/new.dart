// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // class todofirebase extends StatefulWidget {
// //   const todofirebase({Key? key}) : super(key: key);
// //
// //   @override
// //   State<todofirebase> createState() => _todolistState();
// // }
// //
// // class _todolistState extends State<todofirebase> {
// //   late CollectionReference usercollection;
// //
// //   @override
// //   void initState() {
// //     usercollection = FirebaseFirestore.instance.collection('users');
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("To do list"),
// //       ),
// //       body: StreamBuilder<QuerySnapshot>(
// //           stream: readUser(),
// //           builder: (context, snapshot) {
// //             if (snapshot.hasError) {
// //               return Center(
// //                 child: Text('error ${snapshot.error}'),
// //               );
// //             }
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return const Center(
// //                 child: CircularProgressIndicator(),
// //               );
// //             }
// //             final calldocs = snapshot.data!.docs;
// //             return ListView.builder(
// //               itemCount: calldocs.length,
// //               itemBuilder: (context, index) {
// //                 final fetchdatas = calldocs[index];
// //                 final dataid = fetchdatas.id;
// //                 final dataname = fetchdatas['name'];
// //                 final dataemail = fetchdatas['details'];
// //                 return ListTile(
// //                   title: Text(
// //                     '$dataname',
// //                     style: TextStyle(fontSize: 20),
// //                   ),
// //                   subtitle: Text(
// //                     '$dataemail',
// //                     style: TextStyle(fontSize: 20),
// //                   ),
// //                   trailing: SizedBox(
// //                     child: Row(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         IconButton(
// //                             onPressed: () => update(
// //                                   dataid,
// //                                   dataname,
// //                                   dataemail,
// //                                 ),
// //                             icon: Icon(Icons.edit)),
// //                         IconButton(
// //                             onPressed: () => deleteUser(dataid),
// //                             icon: Icon(Icons.delete)),
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //             );
// //           }),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => addform(),
// //         child: Text("add"),
// //       ),
// //     );
// //   }
// //
// //   Future<void> addUsertoDB(String name, String email) async {
// //     return usercollection.add({'name': name, 'details': email}).then((Value) {
// //       print('user added successfully');
// //       nameController.clear();
// //       detailsController.clear();
// //       Navigator.of(context).pop();
// //     }).catchError((error) {
// //       print('failed to add user $error');
// //     });
// //   }
// //
// //   Stream<QuerySnapshot> readUser() {
// //     return usercollection.snapshots();
// //   }
// //
// //   TextEditingController nameController = TextEditingController();
// //   TextEditingController detailsController = TextEditingController();
// //
// //   addform() async {
// //     showModalBottomSheet(
// //         isScrollControlled: true,
// //         context: context,
// //         builder: (context) {
// //           return Container(
// //             padding: EdgeInsets.only(
// //                 top: 10,
// //                 left: 10,
// //                 right: 10,
// //                 bottom: MediaQuery.of(context).viewInsets.bottom + 120),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 TextField(
// //                     controller: nameController,
// //                     decoration: InputDecoration(
// //                         hintText: "name",
// //                         border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(10)))),
// //                 TextField(
// //                     controller: detailsController,
// //                     decoration: InputDecoration(
// //                         hintText: "datails",
// //                         border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(10)))),
// //                 ElevatedButton(
// //                     onPressed: () => addUsertoDB(
// //                         nameController.text, detailsController.text),
// //                     child: const Text('Create text')),
// //               ],
// //             ),
// //           );
// //         });
// //   }
// //
// // //update
// //
// //   TextEditingController cname = TextEditingController();
// //   TextEditingController cdetails = TextEditingController();
// //
// //   update(var dataid, String crtname, String crtemail) async {
// //     cname.text = crtname;
// //     cdetails.text = crtemail;
// //     showModalBottomSheet(
// //         isScrollControlled: true,
// //         context: context,
// //         builder: (context) {
// //           return Container(
// //             padding: EdgeInsets.only(
// //                 top: 10,
// //                 left: 10,
// //                 right: 10,
// //                 bottom: MediaQuery.of(context).viewInsets.bottom + 120),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 TextField(
// //                     controller: cname,
// //                     decoration: InputDecoration(
// //                         hintText: "name",
// //                         border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(10)))),
// //                 TextField(
// //                     controller: cdetails,
// //                     decoration: InputDecoration(
// //                         hintText: "datails",
// //                         border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(10)))),
// //                 ElevatedButton(
// //                     onPressed: () {
// //                       updateUser(dataid, cname.text, cdetails.text);
// //                       cname.clear();
// //                       cdetails.clear();
// //                       Navigator.of(context).pop();
// //                     },
// //                     child: const Text('update')),
// //               ],
// //             ),
// //           );
// //         });
// //   }
// //
// //   Future<void> updateUser(String dataid, String cname, String cdetails) async {
// //     var updatevalues = {"name": cname, "details": cdetails};
// //     return usercollection.doc(dataid).update(updatevalues).then((value) {
// //       Navigator.of(context).pop();
// //       print("user data updated successfully");
// //     }).catchError((error) {
// //       print("user update failed");
// //     });
// //   }
// //
// //   Future<void> deleteUser(var id) async {
// //     return usercollection.doc(id).delete().then((value) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text("User Deleted Successfully")));
// //     }).catchError((error) {
// //       print("user Deletion failed");
// //     });
// //   }
// // }
//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> fetchTasks() {
    return _firestore.collection('tasks').snapshots();
  }

  void updateTaskStatus(String taskId, bool isCompleted) async {
    try {
      await _firestore.collection('tasks').doc(taskId).update({'isCompleted': isCompleted});
    } catch (e) {
      showErrorDialog('Error updating task status: $e');
    }
  }

  void deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } catch (e) {
      showErrorDialog('Error deleting task: $e');
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        backgroundColor: Colors.yellow,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fetchTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final tasks = snapshot.data?.docs ?? [];

          if (tasks.isEmpty) {
            return Center(child: Text('No tasks available.'));
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              final taskData = task.data() as Map<String, dynamic>?;

              if (taskData == null) {
                return SizedBox.shrink();
              }

              final title = taskData['title'] ?? 'Untitled Task';
              final isCompleted = taskData['isCompleted'] ?? false;

              return ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    decoration: isCompleted ? TextDecoration.none : null,
                  ),
                ),
                leading: Checkbox(
                  value: isCompleted,
                  onChanged: (bool? value) {
                    if (value != null) {
                      updateTaskStatus(task.id, value);
                    }
                  },
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deleteTask(task.id);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white12,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add_circle),
      ),
    );
  }
}

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addTask(BuildContext context, String title) async {
    if (title.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task title cannot be empty!')),
      );
      return;
    }
    try {
      await _firestore.collection('tasks').add({'title': title.trim(), 'isCompleted': false});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task added successfully!')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding task: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addTask(context, _taskController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}





