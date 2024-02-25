import 'package:flutter/material.dart';
import 'package:jotflow/main.dart';
import 'pinned.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool isPinned = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text(notes.keys.toString(),
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Color(0xB2303030)))),
            const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text("Description",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.5,
                        color: Color(0x99303030)))),
            const Pinned(),
          ],
        ));
  }
}
