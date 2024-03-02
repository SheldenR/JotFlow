import 'package:flutter/material.dart';
import 'package:jotflow/main.dart';
import '../models/notes_model.dart';
import 'home_screen.dart';

class EditNoteScreen extends StatefulWidget {
  final int noteID;
  const EditNoteScreen({super.key, required this.noteID});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late String title = "";
  late String description = "";
  List<int> colorCycle = [
    0x00FFFFFF,
    0x64FFE054,
    0x644AB3FF,
    0x64FFA869,
    0x641CE0A5
  ];
  List<int> alphaColorCycle = [
    0xFFFFFFFF,
    0xFFfef5d6,
    0xFFdbf0ff,
    0xFFffeee1,
    0xFFd2f9ed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (notes.get(widget.noteID) == null)
          ? Colors.white
          : Color(alphaColorCycle[notes.get(widget.noteID).color]),
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: const Color(0x00FFFFFF),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: const Text("Delete Note"),
                          content: const Text(
                              "Are you sure you want to permanently delete this note?"),
                          actions: [
                            TextButton(
                                child: const Text("Delete Note"),
                                onPressed: () {
                                  notes.delete(widget.noteID);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                  );
                                })
                          ]);
                    },
                  );
                },
                icon: const Icon(Icons.delete_outlined)),
            IconButton(
              onPressed: () {
                setState(() {
                  notes.put(
                      widget.noteID, // ID
                      NotesModel(
                          title: notes.get(widget.noteID).title,
                          description: notes.get(widget.noteID).description,
                          creationTime: notes.get(widget.noteID).creationTime,
                          isPinned: !notes.get(widget.noteID).isPinned,
                          color: notes.get(widget.noteID).color));
                });
              },
              icon: notes.get(widget.noteID).isPinned == true
                  ? const Icon(Icons.push_pin)
                  : const Icon(Icons.push_pin_outlined),
            )
          ]),
      body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                TextField(
                  style: const TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Color(0xFF303030),
                  ),
                  onChanged: (String value) async {
                    notes.put(
                        widget.noteID, // ID
                        NotesModel(
                            title: value,
                            description: notes.get(widget.noteID).description,
                            creationTime: notes.get(widget.noteID).creationTime,
                            isPinned: notes.get(widget.noteID).isPinned,
                            color: notes.get(widget.noteID).color));
                  },
                  controller: TextEditingController()
                    ..text = notes.get(widget.noteID).title,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: -5),
                      hintText: "Title",
                      hintStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Color.fromARGB(83, 48, 48, 48),
                      )),
                ),
                Text(notes.get(widget.noteID).creationTime,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color(0xFF303030),
                    )),
                TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onChanged: (String value) async {
                      notes.put(
                          widget.noteID, // ID
                          NotesModel(
                              title: notes.get(widget.noteID).title,
                              description: value,
                              creationTime:
                                  notes.get(widget.noteID).creationTime,
                              isPinned: notes.get(widget.noteID).isPinned,
                              color: notes.get(widget.noteID).color));
                    },
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color.fromARGB(255, 48, 48, 48),
                      height: 1.5,
                    ),
                    controller: TextEditingController()
                      ..text = notes.get(widget.noteID).description,
                    decoration: const InputDecoration(
                        hintText: "Enter note contents...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 20, bottom: 150),
                        hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 21,
                          color: Color.fromARGB(85, 48, 48, 48),
                          height: 1.5,
                        ))),
              ]))),
    );
  }
}
