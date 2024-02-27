import 'package:flutter/material.dart';
import 'package:jotflow/main.dart';
import '../models/notes_model.dart';
import 'home_screen.dart';

class NewNoteScreen extends StatefulWidget {
  final int noteID;
  const NewNoteScreen({super.key, required this.noteID});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  bool pinned = false;
  late String title = "";
  late String description = "";

  String monthParse(int month) {
    var monthList = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return monthList[month - 1];
  }

  String timeParse(int hour, int minute) {
    String amPM = "AM";
    String minuteString = "";
    if (hour > 12) {
      hour -= 12;
      amPM = "PM";
    }
    if (minute < 10) {
      minuteString = "0${minute.toString()}";
    } else {
      minuteString = minute.toString();
    }
    return "$hour:$minuteString$amPM";
  }

  late String noteCreationDate =
      "${(DateTime.now().day).toString()} ${monthParse(DateTime.now().month)} ${(DateTime.now().year).toString()}, ${timeParse(DateTime.now().hour, DateTime.now().minute)}";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
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
                setState(() {
                  pinned = !pinned;
                  if (notes.get(widget.noteID) == null) {
                    // Key doesnt exist
                    notes.put(
                        widget.noteID, // ID
                        NotesModel(
                            title: "No Title",
                            description: "No note contents",
                            creationTime: noteCreationDate,
                            isPinned: pinned));
                  } else {
                    // If key already exists
                    notes.put(
                        widget.noteID, // ID
                        NotesModel(
                            title: notes.get(widget.noteID).title,
                            description: notes.get(widget.noteID).description,
                            creationTime: notes.get(widget.noteID).creationTime,
                            isPinned: pinned));
                  }
                });
              },
              icon: pinned == true
                  ? const Icon(Icons.push_pin)
                  : const Icon(Icons.push_pin_outlined),
            )
          ]),
      body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: SingleChildScrollView(
              child: Expanded(
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
                    if (notes.get(widget.noteID) == null) {
                      // Key doesnt exist
                      notes.put(
                          widget.noteID, // ID
                          NotesModel(
                              title: value,
                              description: "No note contents",
                              creationTime: noteCreationDate,
                              isPinned: pinned));
                    } else {
                      // If key already exists
                      notes.put(
                          widget.noteID, // ID
                          NotesModel(
                              title: value,
                              description: notes.get(widget.noteID).description,
                              creationTime:
                                  notes.get(widget.noteID).creationTime,
                              isPinned: notes.get(widget.noteID).isPinned));
                    }
                  },
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
                Text(noteCreationDate,
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
                      if (notes.get(widget.noteID) == null) {
                        // Key doesnt exist
                        notes.put(
                            widget.noteID, // ID
                            NotesModel(
                                title: "No Title",
                                description: value,
                                creationTime: noteCreationDate,
                                isPinned: pinned));
                      } else {
                        // If key already exists
                        notes.put(
                            widget.noteID, // ID
                            NotesModel(
                                title: notes.get(widget.noteID).title,
                                description: value,
                                creationTime:
                                    notes.get(widget.noteID).creationTime,
                                isPinned: notes.get(widget.noteID).isPinned));
                      }
                    },
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color.fromARGB(255, 48, 48, 48),
                      height: 1.5,
                    ),
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
              ])))),
    );
  }
}
