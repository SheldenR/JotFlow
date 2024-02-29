import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jotflow/screens/new_note.dart';
import 'package:jotflow/main.dart';
import '../util/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentTime = (DateTime.parse((DateTime.now()).toString())).hour;
  bool showAllNotes = true;
  int currentPageIndex = 0;
  int selectedButton = 1;

  String getGreeting() {
    if (currentTime < 5) {
      // 12:00AM to 4:59AM
      return "I think it's about time to go to bed...";
    } else if (currentTime >= 5 && currentTime < 12) {
      // 5:00AM to 11:59AM
      return "Taking notes in the morning I see?";
    } else if (currentTime >= 12 && currentTime < 17) {
      // 12:00PM to 4:59PM
      return "Another productive afternoon!";
    } else {
      // 5:00PM to 11:59PM
      return "Just one quick note before bed!";
    }
  }

  int nextID(int index) {
    List<int> availableIDs = [];
    List<int> availableUnpinnedIDs = [];
    List<int> availablePinnedIDs = [];
    for (int i = 0; i < notes.length; i++) {
      availableIDs.add(notes.keys.elementAt(i));
    }
    for (int i = 0; i < availableIDs.length; i++) {
      if (notes.get(availableIDs[i]).isPinned == true) {
        availablePinnedIDs.add(notes.keys.elementAt(i));
      } else {
        availableUnpinnedIDs.add(notes.keys.elementAt(i));
      }
    }

    return (availablePinnedIDs.reversed.toList() +
        availableUnpinnedIDs.reversed.toList())[index];
  }

  int createID() {
    if (notes.length == 0) {
      return 0;
    } else {
      return notes.keys.last + 1;
    }
  }

  int numOfPinned() {
    int count = 0;
    for (int i = 0; i < notes.length; i++) {
      if (notes.getAt(i).isPinned == true) {
        count++;
      }
    }

    return count;
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        scrolledUnderElevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("JotFlow",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Color(0xFF303030),
                )),
            Text(getGreeting(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w300,
                  fontSize: 14.4,
                  color: Color(0xFF303030),
                )),
          ],
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
              const Text("")
            ],
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showAllNotes = true;
                            selectedButton = 1;
                          });
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: selectedButton == 1
                                ? const Color(0xFFF9CC31)
                                : const Color(0x00000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            side: const BorderSide(
                                color: Color(0xFFF9CC31), width: 2)),
                        child: Text("All (${notes.length})",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: selectedButton == 1
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              fontSize: 14.4,
                              color: const Color(0xFF303030),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showAllNotes = false;
                            selectedButton = 2;
                          });
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: selectedButton == 2
                                ? const Color(0xFFF9CC31)
                                : const Color(0x00000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            side: const BorderSide(
                                color: Color(0xFFF9CC31), width: 2)),
                        child: Text("Pinned",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: selectedButton == 2
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              fontSize: 14.4,
                              color: const Color(0xFF303030),
                            )),
                      ),
                    ),
                  ],
                )),
            if (notes.length > 0 && showAllNotes)
              Expanded(
                  child: MasonryGridView.builder(
                itemCount: notes.length,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  // Implement sorting by pinned first here
                  return NoteCard(noteID: nextID(index));
                },
              ))
            else if (notes.length > 0 && !showAllNotes)
              Expanded(
                  child: MasonryGridView.builder(
                itemCount: numOfPinned(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) {
                  // Implement sorting by pinned first here
                  return NoteCard(noteID: nextID(index));
                },
              ))
            else if (notes.length == 0)
              Padding(
                  padding: EdgeInsets.only(
                      left: deviceHeight(context) * 0.067,
                      right: deviceHeight(context) * 0.067),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: deviceHeight(context) * 0.125, bottom: 25),
                          child: const Image(
                            image: AssetImage('assets/no_notes.png'),
                            width: 150,
                          )),
                      const Text(
                        "It seems you don’t currently have any notes. Add to your JotFlow by creating a note using the plus button below.",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          color: Color(0x7F303030),
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ))
          ])),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFFF9CC31),
        splashColor: const Color(0xFFF9CC31),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewNoteScreen(noteID: createID()),
              ));
        },
        child: const Icon(Icons.add,
            color: Color.fromARGB(255, 255, 255, 255), size: 28),
      ),
    );
  }
}
