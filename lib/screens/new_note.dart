import 'package:flutter/material.dart';
import 'package:jotflow/main.dart';
import '../models/notes_model.dart';
import 'home_screen.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  bool isPinned = false;
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

  int findNextID() {
    if (notes.length == 0) {
      return 0;
    } else {
      return notes.keys.last + 1;
    }
  }

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
                  isPinned = !isPinned;
                });
              },
              icon: isPinned == true
                  ? const Icon(Icons.push_pin)
                  : const Icon(Icons.push_pin_outlined),
            )
          ]),
      body: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18),
          child: SingleChildScrollView(
              child: Expanded(
                  child: Column(
                      //padding: const EdgeInsets.only(left: 18, right: 18),
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
                  onChanged: (value) => title = value,
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
                    onChanged: (value) => description = value,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                      color: Color.fromARGB(255, 48, 48, 48),
                      height: 1.5,
                    ),
                    decoration: const InputDecoration(
                        hintText: "Enter your notes here...",
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
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF303030),
        splashColor: const Color(0xFF303030),
        onPressed: () {
          FocusScope.of(context).unfocus();
          notes.put(
              findNextID(), // ID
              NotesModel(
                  title: title,
                  description: description,
                  creationTime: noteCreationDate,
                  isPinned: false));
        },
        child: const Icon(Icons.check, color: Colors.white, size: 28),
      ),
    );
  }
}
