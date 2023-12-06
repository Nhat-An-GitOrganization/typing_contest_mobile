import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:typing_contest_mobile/screen/home_screen.dart';
// import 'package:typing_contest_mobile/screen/login_screen.dart';

import 'component/ranking/caroulsel_Ranking.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    final textTheme =
        isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme;
    final newTextStyle = textTheme.apply(
      fontFamily: 'BeVietnamPro',
    );
    
    return MaterialApp(
      theme: ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        textTheme: newTextStyle,
      ),
      debugShowCheckedModeBanner: false,
      home: const CaroulselRank(),
    );
  }
}
