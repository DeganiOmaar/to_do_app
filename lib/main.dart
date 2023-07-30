// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/counter.dart';
import 'package:to_do_app/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  List aLLTasks = [
    Task(title: " Publish Video", status: false),
    Task(title: " Playing valorant", status: true),
    Task(title: " Naleeb Rami", status: false)
  ];

  delete(taskIndex) {
    setState(() {
      aLLTasks.remove(aLLTasks[taskIndex]);
    });
  }

  clean() {
    setState(() {
      aLLTasks.clear();
    });
  }

  changeStatus(int taskIndex) {
    //besh yaaref index gedesh
    setState(() {
      aLLTasks[taskIndex].status = !aLLTasks[taskIndex].status;
    });
  }

  String newTask = "";
  final myController = TextEditingController();

  int calculateCompletedTasks() {
    int completedTasks = 0;

    for (var item in aLLTasks) {
      if (item.status) {
        //automatiquement true b jomla heki
        completedTasks++;
      }
    }

    return completedTasks;
  }

  addNewTask() {
    setState(() {
      newTask = myController.text;
      aLLTasks.add(Task(title: newTask, status: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.7),
      appBar: AppBar(
        title: Text(
          "To Do App",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              clean();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 36,
            color: const Color.fromARGB(255, 250, 114, 104),
          ),
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
        // centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Counter(
                    allTodos: aLLTasks.length,
                    allCompleted: calculateCompletedTasks(),
                  ),
                  // Todocard(),
                  SizedBox(
                    height: 570,
                    child: ListView.builder(
                        itemCount: aLLTasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Todocard(
                            vartitle: aLLTasks[index].title,
                            doneORnot: aLLTasks[index].status,
                            myfunc: changeStatus,
                            delete: delete,
                            // clean : clean,
                            iii: index,
                          );
                        }),
                  ),

                  // ...aLLTasks.map(
                  //   (item) =>
                  // ),
                  // 3 pts yaamlou destruction li hwa tadmir besh twali List
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(

              // isScrollControlled: true,
              //behs tkhali l wahed iben aal ecran lkl
              // khtr hwa men lowel yekhou ken chtar
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    padding: EdgeInsets.all(22),
                    // color: Color.fromARGB(255, 255, 255, 255),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: myController,
                          maxLength: 25,
                          decoration: InputDecoration(
                            hintText: "Add new Task",
                            //tnajem taamllabel text wle hint as u like bruda
                          ),
                        ),
                        //text field  tekteb fyyh
                        // SizedBox(
                        //   height: 20,
                        // ),
                        TextButton(
                          onPressed: () {
                            addNewTask();
                            Navigator.pop(context);
                          },
                          child: Text("ADD",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
