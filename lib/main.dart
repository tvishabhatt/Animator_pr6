import 'package:animator_pr6/Bookmark.dart';
import 'package:animator_pr6/HomePage.dart';
import 'package:animator_pr6/PlanetsModal.dart';
import 'package:animator_pr6/Splace_Screen.dart';
import 'package:animator_pr6/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences=await SharedPreferences.getInstance();
  bool isDark=preferences.getBool('appTheme')??false;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider(themeModal: ThemeModal(isDark: isDark)),),
    ChangeNotifierProvider(create: (context) => Planets_Provider(),),
    ChangeNotifierProvider(create: (context) => Bookmark(),),

  ],
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: (Provider.of<ThemeProvider>(context).themeModal.isDark)?ThemeMode.dark:ThemeMode.light,
      home: Splace_Screen(),
    );
  }
}


