import 'package:flutter/material.dart';
import 'package:jotflow/main.dart';
import '../screens/edit_note.dart';
import 'pinned.dart';

class NoteCard extends StatefulWidget {
  final int noteID;
  const NoteCard({super.key, required this.noteID});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFD4D4D4)),
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 8),
                    child: Text(notes.get(widget.noteID).title,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Color(0xB2303030)))),
                Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(notes.get(widget.noteID).description,
                        style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.5,
                            color: Color(0x99303030)))),
                notes.get(widget.noteID).isPinned == true
                    ? const Pinned()
                    : const Center(),
              ],
            )),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditNoteScreen(noteID: widget.noteID),
              ));
        },
        onLongPress: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return const SizedBox(
                    height: 300,
                    child: Center(
                      child: Text("test"),
                    ));
              });
        });
  }
}
