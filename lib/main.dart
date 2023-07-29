import 'package:flutter/material.dart';
import 'package:flutter_chat_with_stream/screens/screens.dart';
import 'package:flutter_chat_with_stream/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MaterialApp(
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
