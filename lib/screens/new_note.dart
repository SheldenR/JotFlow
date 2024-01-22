import 'package:flutter/material.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
        body: const Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color.fromARGB(122, 48, 48, 48),
                    )),
              ),
              Text("Placeholder date and time",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w300,
                    fontSize: 14.4,
                    color: Color(0xFF303030),
                  )),
              TextField()
            ])));
  }
}
