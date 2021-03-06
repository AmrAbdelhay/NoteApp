import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noteapp/splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Notes SQLite';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    themeMode: ThemeMode.dark,
    theme: ThemeData(
      primaryColor: Colors.transparent,
      scaffoldBackgroundColor: Color(0xff444444),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    home: Splash(),
  );
}
