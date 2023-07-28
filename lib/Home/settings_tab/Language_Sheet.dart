import 'package:flutter/material.dart';
import 'package:lotti/provider/provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
                provider.changeLanguage('en');
              },
              child: provider.currentLanguage == 'en'
                  ? isSelected('English')
                  : isUnSelected('English')),
          SizedBox(
            height: 70,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.currentLanguage == 'en'
                  ? isUnSelected('العربية')
                  : isSelected('العربية')),
        ],
      ),
    );
  }

  Widget isSelected(String ThemeName) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 200,
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
      width: 200,
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
