import 'package:flutter/material.dart';
import '../models/notes_model.dart';
import '../main.dart';

class NoteModalSheet extends StatefulWidget {
  final int noteID;
  const NoteModalSheet({super.key, required this.noteID});

  @override
  State<NoteModalSheet> createState() => _NoteModalSheetState();
}

class _NoteModalSheetState extends State<NoteModalSheet> {
  @override
  Widget build(BuildContext context) {
    int selectedColor = notes.get(widget.noteID).color + 1;

    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SizedBox(
            height: 300,
            child: Center(
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF2E2E2E),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                color: selectedColor == 1
                                    ? Colors.white
                                    : const Color(0x00FFFFFF),
                                icon: const Icon(Icons.check),
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/');
                                  notes.put(
                                      widget.noteID,
                                      NotesModel(
                                          title: notes.get(widget.noteID).title,
                                          description: notes
                                              .get(widget.noteID)
                                              .description,
                                          creationTime: notes
                                              .get(widget.noteID)
                                              .creationTime,
                                          isPinned:
                                              notes.get(widget.noteID).isPinned,
                                          color: 0));
                                  setState(() {
                                    selectedColor = 1;
                                  });
                                },
                              ))),
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFE054),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                color: selectedColor == 2
                                    ? Colors.white
                                    : const Color(0x00FFFFFF),
                                icon: const Icon(Icons.check),
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/');
                                  notes.put(
                                      widget.noteID,
                                      NotesModel(
                                          title: notes.get(widget.noteID).title,
                                          description: notes
                                              .get(widget.noteID)
                                              .description,
                                          creationTime: notes
                                              .get(widget.noteID)
                                              .creationTime,
                                          isPinned:
                                              notes.get(widget.noteID).isPinned,
                                          color: 1));
                                  setState(() {
                                    selectedColor = 2;
                                  });
                                },
                              ))),
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF4AB3FF),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                color: selectedColor == 3
                                    ? Colors.white
                                    : const Color(0x00FFFFFF),
                                icon: const Icon(Icons.check),
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/');
                                  notes.put(
                                      widget.noteID,
                                      NotesModel(
                                          title: notes.get(widget.noteID).title,
                                          description: notes
                                              .get(widget.noteID)
                                              .description,
                                          creationTime: notes
                                              .get(widget.noteID)
                                              .creationTime,
                                          isPinned:
                                              notes.get(widget.noteID).isPinned,
                                          color: 2));
                                  setState(() {
                                    selectedColor = 3;
                                  });
                                },
                              ))),
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFA869),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                color: selectedColor == 4
                                    ? Colors.white
                                    : const Color(0x00FFFFFF),
                                icon: const Icon(Icons.check),
                                onPressed: () {
                                  Navigator.popAndPushNamed(context, '/');
                                  notes.put(
                                      widget.noteID,
                                      NotesModel(
                                          title: notes.get(widget.noteID).title,
                                          description: notes
                                              .get(widget.noteID)
                                              .description,
                                          creationTime: notes
                                              .get(widget.noteID)
                                              .creationTime,
                                          isPinned:
                                              notes.get(widget.noteID).isPinned,
                                          color: 3));
                                  setState(() {
                                    selectedColor = 4;
                                  });
                                },
                              ))),
                      Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF1CE0A5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            color: selectedColor == 5
                                ? Colors.white
                                : const Color(0x00FFFFFF),
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/');
                              notes.put(
                                  widget.noteID,
                                  NotesModel(
                                      title: notes.get(widget.noteID).title,
                                      description:
                                          notes.get(widget.noteID).description,
                                      creationTime:
                                          notes.get(widget.noteID).creationTime,
                                      isPinned:
                                          notes.get(widget.noteID).isPinned,
                                      color: 4));
                              setState(() {
                                selectedColor = 5;
                              });
                            },
                          ))
                    ])),
                const Row(children: [
                  Icon(Icons.delete_outlined, size: 30),
                  Text("Delete Note",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                        color: Color(0xFF303030),
                      ))
                ]),
                const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(children: [
                      Icon(Icons.content_copy_outlined, size: 30),
                      Text("Duplicate Note",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Color(0xFF303030),
                          ))
                    ])),
                const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Row(children: [
                      Icon(Icons.create_outlined, size: 30),
                      Text("Edit Note",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Color(0xFF303030),
                          ))
                    ])),
              ]),
            )));
  }
}
