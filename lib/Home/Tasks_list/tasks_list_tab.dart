import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lotti/Home/Tasks_list/task_widget.dart';
import 'package:lotti/database/Task.dart';
import 'package:lotti/database/my_database.dart';

class TasksListTab extends StatefulWidget {
  @override
  State<TasksListTab> createState() => _TasksListTabState();
}

class _TasksListTabState extends State<TasksListTab> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.title,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 26)),
          )),
      body: Column(
        children: [
          Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.07),
                //     spreadRadius: 1,
                //     blurRadius: 7,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
                ),
            child: CalendarTimeline(
              initialDate: selectedDate,
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) {
                if (date == null) return;
                setState(() {
                  selectedDate = date;
                });
              },
              monthColor: Theme.of(context).primaryColor,
              dayColor: Theme.of(context).cardColor,
              activeDayColor: Theme.of(context).cardColor,
              activeBackgroundDayColor: Theme.of(context).primaryColor,
              dotsColor: Color(0xFF333A47),
              locale: 'en_ISO',
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Task>>(
              // future: MyDatabase.getAllTasks(),
              stream: MyDatabase.listenForRealTimeUpdate(selectedDate),
              builder: (buildContext, snaphot) {
                if (snaphot.hasError) {
                  return Text('Erorr Loading Data..');
                } else if (snaphot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                var data = snaphot.data?.docs
                    .map((elemint) => elemint.data())
                    .toList();
                return ListView.builder(
                  itemBuilder: (buildContext, index) {
                    return TasckWidget(data![index]);
                  },
                  itemCount: data!.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
