import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD4D4D4)),
            borderRadius: BorderRadius.circular(14)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Current AI Topic",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Color(0xB2303030))),
            Text(
                "Artificial Intelligence (AI) is an ever-evolving frontier, revolutionizing how we live and work. At its core, AI mimics human intelligence, enabling machines to learn, reason",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.5,
                    color: Color(0x99303030)))
          ],
        ));
  }
}
