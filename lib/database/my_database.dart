import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lotti/date.dart';

import 'Task.dart';

class MyDatabase {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        .withConverter<Task>(fromFirestore: (snapshot, options) {
      return Task.fromFirestore(snapshot.data()!);
    }, toFirestore: (task, options) {
      return task.toFirestore();
    });
  }

  static Future<void> insertTask(Task task) {
    var tasksCollection = getTasksCollection();
    var taskDoc = tasksCollection.doc(); //create New doc
    task.id = taskDoc.id;
    return taskDoc.set(task); //get Doc >> then set // update
  }

  static Future<QuerySnapshot<Task>> getAllTasks(DateTime selectedDate) async {
    QuerySnapshot<Task> querySnapshot = await getTasksCollection()
        .where('dateTime',
            isEqualTo: dateOnly(selectedDate).millisecondsSinceEpoch)
        .get();

    return querySnapshot;
  }

  static Stream<QuerySnapshot<Task>> listenForRealTimeUpdate(
      DateTime selectedDate) {
    return getTasksCollection()
        .where('dateTime',
            isEqualTo: dateOnly(selectedDate).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(Task task) {
    var taskDoc = getTasksCollection().doc(task.id);
    return taskDoc.delete();
  }

  static Isdone(Task task) {
    CollectionReference taskRef = getTasksCollection();
    taskRef.doc(task.id).update({
      'isDone': task.isDone! ? false : true,
    });
  }

  static Future<void> editTaskDetails(Task task) {
    CollectionReference todoRef = getTasksCollection();
    return todoRef.doc(task.id).update({
      'title': task.title,
      'description': task.description,
      'dateTime': task.dateTime!.millisecondsSinceEpoch,
    });
  }
}
