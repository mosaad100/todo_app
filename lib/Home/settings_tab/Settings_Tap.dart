import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lotti/Home/settings_tab/Language_Sheet.dart';
import 'package:lotti/Home/settings_tab/Setting_Sheet.dart';
import 'package:lotti/provider/provider.dart';
import 'package:provider/provider.dart';

class Settings_Tap extends StatefulWidget {
  @override
  State<Settings_Tap> createState() => _Settings_TapState();
}

class _Settings_TapState extends State<Settings_Tap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
        child: Column(
      children: [
        Stack(children: [
          Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Theme.of(context).primaryColor,
              ),
              padding: EdgeInsets.only(
                top: 100,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
            child: Text(AppLocalizations.of(context)!.settings,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    ?.copyWith(fontSize: 32)),
          ),
        ]),
        SizedBox(
          height: 50,
        ),
        // Language bottom
        Text(AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline1),
        InkWell(
          onTap: bottomSheetLanguage,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).backgroundColor,
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 2)),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                        provider.currentLanguage == 'ar'
                            ? 'العربية'
                            : 'English',
                        style: Theme.of(context).textTheme.headline1)),
                Icon(
                  Icons.check,
                  size: 35,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
        //...
        SizedBox(
          height: 20,
        ),
        //...
        // Mood bottom
        Text(AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.headline1),
        InkWell(
          onTap: bottomSheetTheme,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).backgroundColor,
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 2)),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                        provider.isDark()
                            ? AppLocalizations.of(context)!.dark
                            : AppLocalizations.of(context)!.light,
                        style: Theme.of(context).textTheme.headline1)),
                Icon(
                  Icons.check,
                  size: 35,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void bottomSheetLanguage() {
    showModalBottomSheet(
        context: (context),
        builder: (buildcontext) {
          return LanguageBottomSheet();
        });
  }

  void bottomSheetTheme() {
    showModalBottomSheet(
        context: (context),
        builder: (buildcontext) {
          return ThemeBottomSheet();
        });
  }
}
