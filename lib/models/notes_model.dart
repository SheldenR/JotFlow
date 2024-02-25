import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 1)
class NotesModel {
  NotesModel(
      {required this.title,
      required this.description,
      required this.creationTime,
      required this.isPinned});

  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  String creationTime;

  @HiveField(4)
  bool isPinned;
}
