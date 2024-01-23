import 'package:flutter/material.dart';

class Pinned extends StatelessWidget {
  const Pinned({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(left: 14, right: 14, top: 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.push_pin_outlined,
                  size: 20, color: Color.fromARGB(150, 48, 48, 48)),
              Text(" Pinned",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14.5,
                    color: Color(0x99303030),
                    fontWeight: FontWeight.w300,
                  ))
            ]));
  }
}
