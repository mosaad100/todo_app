import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lotti/Home/dialoge.dart';
import 'package:lotti/database/Task.dart';
import 'package:lotti/database/my_database.dart';
import 'package:lotti/date.dart';

class AddTaskBottom extends StatefulWidget {
  @override
  State<AddTaskBottom> createState() => _AddTaskBottomState();
}

class _AddTaskBottomState extends State<AddTaskBottom> {
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets * 0.5,
      child: Container(
        color: Theme.of(context).backgroundColor,
        height: MediaQuery.of(context).size.height * 0.6,
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    AppLocalizations.of(context)!.addtask,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
                TextFormField(
                  controller: titleController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter title';
                    }
                    return null;
                  },
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).cardColor),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Theme.of(context).cardColor)),
                      labelText: AppLocalizations.of(context)!.title_,
                      labelStyle:
                          TextStyle(color: Theme.of(context).cardColor)),
                ),
                SizedBox(height: 5),
                TextFormField(
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).cardColor),
                  controller: descController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter Description';
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Theme.of(context).cardColor)),
                      labelText: AppLocalizations.of(context)!.desc,
                      labelStyle:
                          TextStyle(color: Theme.of(context).cardColor)),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    showDateDialog();
                  },
                  child: Column(
                    children: [
                      Text(AppLocalizations.of(context)!.date,
                          style: Theme.of(context).textTheme.headline3),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                            style: Theme.of(context).textTheme.headline2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      adTask();
                    },
                    child: Text(
                      AppLocalizations.of(context)!.add,
                      style: Theme.of(context).textTheme.headline2,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  void showDateDialog() async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (date != null) {
      selectedDate = date;
      setState(() {});
    }
  }

  void adTask() {
    if (formKey.currentState?.validate() == true) {
      String title = titleController.text;
      String desc = descController.text;
      Task task = Task(
          title: title,
          description: desc,
          dateTime: dateOnly(selectedDate),
          isDone: false);
      ShowLoading(context, 'Loading...');
      MyDatabase.insertTask(task).then((value) {
        Navigator.pop(context);
        ShowMessage(context, 'Task Added Success', posActionName: 'OK',
            posAction: () {
          Navigator.pop(context);
        });
      }).onError((error, stackTrace) {
        Navigator.pop(context);
        ShowMessage(context, 'Task Added Failed');
        Navigator.pop(context);
      }).timeout(Duration(seconds: 2), onTimeout: () {
        Navigator.pop(context);
        ShowMessage(context, 'Task Added Locally Successfully',
            posActionName: 'Ok', posAction: () {
          Navigator.pop(context);
        });
      });
    }
  }
}
