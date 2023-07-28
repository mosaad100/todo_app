import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lotti/provider/provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? isSelected(AppLocalizations.of(context)!.dark)
                  : isUnSelected(AppLocalizations.of(context)!.dark)),
          SizedBox(
            height: 60,
          ),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDark()
                  ? isUnSelected(AppLocalizations.of(context)!.light)
                  : isSelected(AppLocalizations.of(context)!.light)),
        ],
      ),
    );
  }

  Widget isSelected(String ThemeName) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 180,
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Row(
        children: [
          Expanded(
            child: Center(
                child: Text(
              ThemeName,
              style: Theme.of(context).textTheme.headline1,
            )),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }

  Widget isUnSelected(String ThemeName) {
    return Container(
      width: 180,
      height: 60,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
      child: Center(
          child: Text(
        ThemeName,
        style: Theme.of(context).textTheme.headline1,
      )),
    );
  }
}
