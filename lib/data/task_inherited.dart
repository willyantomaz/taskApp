// import 'package:flutter/material.dart';
// import 'package:teste/componets/task.dart';
//
// class TaskInherited extends InheritedWidget {
//   TaskInherited({
//     super.key,
//     required Widget child,
//   }) : super(child: child);
//
//   final List<Task> taskList = [
//     const Task('Aprender Flutter e n para de estudar ',
//         'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 4),
//     const Task(
//         'Meditar',
//         'https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg',
//         2),
//     const Task('ler', 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 3),
//     const Task('pedalar', 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg',
//         5),
//     const Task('Jogar', 'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 1),
//   ];
//
//   void newTask(String name,String photo,int difficulty){
//     taskList.add(Task(name, photo, difficulty));
//   }
//
//
//   static TaskInherited of(BuildContext context) {
//     final TaskInherited? result =
//         context.dependOnInheritedWidgetOfExactType<TaskInherited>();
//     assert(result != null, 'No TaskInherited found in context');
//     return result!;
//   }
//
//   @override
//   bool updateShouldNotify(TaskInherited oldWidget) {
//     return oldWidget.taskList.length != taskList.length;
//   }
// }
//
