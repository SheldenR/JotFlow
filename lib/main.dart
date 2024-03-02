import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/notes_model.dart';
import 'screens/home_screen.dart';

late Box notes;
Future<void> main() async {
  // Hive Database
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  notes = await Hive.openBox('notes');

  // Run application
  runApp(const MyApp());

  // System Settings
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black.withOpacity(0.002),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
