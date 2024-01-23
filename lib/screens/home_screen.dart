import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jotflow/screens/new_note.dart';
import '../util/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentTime = (DateTime.parse((DateTime.now()).toString())).hour;
  int currentPageIndex = 0;
  int selectedButton = 1;

  String getGreeting() {
    if (currentTime < 5) {
      return "Sweet dreams, Shelden";
    } else if (currentTime >= 5 && currentTime < 12) {
      return "Good Morning, Shelden";
    } else if (currentTime >= 12 && currentTime < 17) {
      return "Good Afternoon, Shelden";
    } else {
      return "Good Night, Shelden";
    }
  }

  @override
  Widget build(BuildContext context) {
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
                icon: const Icon(Icons.sort),
              ),
              const Text("")
            ],
          ),
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
                            selectedButton = 1;
                          });
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF303030),
                            backgroundColor: selectedButton == 1
                                ? const Color(0xFFFFE054)
                                : const Color(0x00000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            side: const BorderSide(
                                color: Color(0xFFFFE054), width: 2)),
                        child: Text("All (0)",
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
                            selectedButton = 2;
                          });
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF303030),
                            backgroundColor: selectedButton == 2
                                ? const Color(0xFFFFE054)
                                : const Color(0x00000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            side: const BorderSide(
                                color: Color(0xFFFFE054), width: 2)),
                        child: Text("Notes",
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
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedButton = 3;
                          });
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF303030),
                            backgroundColor: selectedButton == 3
                                ? const Color(0xFFFFE054)
                                : const Color(0x00000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            side: const BorderSide(
                                color: Color(0xFFFFE054), width: 2)),
                        child: Text("Groups",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: selectedButton == 3
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              fontSize: 14.4,
                              color: const Color(0xFF303030),
                            )),
                      ),
                    ),
                  ],
                )),
            Expanded(
                child: MasonryGridView.builder(
              itemCount: 5,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) => const NoteCard(),
            ))
          ])),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF303030),
        splashColor: const Color(0xFF303030),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewNoteScreen(),
              ));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      bottomNavigationBar: NavigationBar(
        surfaceTintColor: const Color.fromARGB(0, 255, 255, 255),
        indicatorColor: const Color.fromARGB(255, 238, 238, 238),
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.home, color: Color(0xFF303030)),
              icon: Icon(Icons.home_outlined, color: Color(0xFF303030)),
              label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.search, color: Color(0xFF303030)),
              label: "Search"),
          NavigationDestination(
              selectedIcon: Icon(Icons.push_pin, color: Color(0xFF303030)),
              icon: Icon(Icons.push_pin_outlined, color: Color(0xFF303030)),
              label: "Pinned"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
      ),
    );
  }
}
