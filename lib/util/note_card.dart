import 'package:flutter/material.dart';
import 'package:jotflow/main.dart';
import 'package:jotflow/util/modal_sheet.dart';
import '../screens/edit_note.dart';
import 'pinned.dart';

class NoteCard extends StatefulWidget {
  final int noteID;
  const NoteCard({super.key, required this.noteID});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  Future<void> showModal(int id) async {
    await showModalBottomSheet(
        barrierColor: Colors.black.withOpacity(0.2),
        showDragHandle: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return NoteModalSheet(noteID: id);
        });
  }

  String formattedDescription() {
    if (notes.get(widget.noteID).description.length > 150) {
      return notes.get(widget.noteID).description.substring(1, 150);
    } else {
      return notes.get(widget.noteID).description;
    }
  }

  List<int> colorCycle = [
    0x00FFFFFF,
    0xFFFFE054,
    0xFF4AB3FF,
    0xFFFFA869,
    0xFF1CE0A5
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                color: Color(colorCycle[notes.get(widget.noteID).color]),
                border: notes.get(widget.noteID).color == 0
                    ? Border.all(color: const Color(0xFFD4D4D4))
                    : Border.all(color: const Color(0x00FFFFFF)),
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
                    child: Text(formattedDescription(),
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
          showModal(widget.noteID);
        });
  }
}
