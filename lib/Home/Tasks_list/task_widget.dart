import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lotti/Home/Tasks_list/edit_Screen.dart';
import 'package:lotti/Home/dialoge.dart';
import 'package:lotti/My_Theme.dart';
import 'package:lotti/database/Task.dart';
import 'package:lotti/database/my_database.dart';
import 'package:lotti/provider/provider.dart';
import 'package:provider/provider.dart';

class TasckWidget extends StatelessWidget {
  Task task;

  TasckWidget(this.task);

  @override
  Widget build(BuildContext context) {
    var proider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => editScreen(task)));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Slidable(
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    MyDatabase.deleteTask(task).then((value) {
                      ShowMessage(context, 'Data Deleted Success',
                          posActionName: 'Ok');
                    }).onError((error, stackTrace) {
                      ShowMessage(context, 'Something went Wrong ');
                    }).timeout(Duration(seconds: 5), onTimeout: () {
                      ShowMessage(context, 'Data Deleted Locally',
                          posActionName: 'Ok');
                    });
                  },
                  backgroundColor: MyTheme.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: AppLocalizations.of(context)!.delete,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    topLeft: Radius.circular(18),
                  ),
                ),
              ],
            ),
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      width: 6,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: task.isDone!
                            ? MyTheme.green
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title ?? '',
                            style: task.isDone!
                                ? Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(color: MyTheme.green)
                                : Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(height: 25),
                          Row(
                            children: [
                              Icon(
                                Icons.description_outlined,
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                task.description ?? '',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        MyDatabase.Isdone(task);
                        proider.refreshApp();
                      },
                      child: task.isDone!
                          ? Text('   Done   ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(color: MyTheme.green, fontSize: 25))
                          : Container(
                              margin: EdgeInsets.all(25),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
