import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lotti/Home/home_screen.dart';
import 'package:lotti/My_Theme.dart';
import 'package:lotti/provider/provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        // editScreen.routeName: (_) => editScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: provider.currentThem,
    );
  }
}
