import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/typing/key_board.dart';
import 'package:typing_contest_mobile/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:typing_contest_mobile/screen/home_screen.dart';

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
    return MaterialApp(
      theme: context.watch<ThemeProvider>().isDarkMode
          ? ThemeData.dark()
          : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const KeyBoard(),
    );
  }
}
