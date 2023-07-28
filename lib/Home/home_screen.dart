import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lotti/Home/Tasks_list/Add_Task_bottom.dart';
import 'package:lotti/Home/Tasks_list/tasks_list_tab.dart';
import 'package:lotti/Home/settings_tab/Settings_Tap.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          color: Theme.of(context).backgroundColor,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: (Lottie.asset('assets/lotti/list.zip', width: 40)),
                  label: AppLocalizations.of(context)!.task),
              BottomNavigationBarItem(
                  icon: (Lottie.asset('assets/lotti/settings.zip', width: 45)),
                  label: AppLocalizations.of(context)!.settings),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTaskBottomSheet,
        child: Lottie.asset('assets/lotti/add.zip'),
        backgroundColor: Colors.blueAccent,
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 3)),
      ),
    );
  }

  var tabs = [TasksListTab(), Settings_Tap()];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (buildcontext) {
          return AddTaskBottom();
        },
        isScrollControlled: true);
  }
}
