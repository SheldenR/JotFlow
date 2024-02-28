import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 1)
class NotesModel {
  NotesModel(
      {required this.title,
      required this.description,
      required this.creationTime,
      required this.isPinned,
      required this.color});

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String creationTime;

  @HiveField(3)
  bool isPinned;

  @HiveField(4)
  int color; // 0: default, 1: yellow, 2: blue, 3: orange, 4: green
}
