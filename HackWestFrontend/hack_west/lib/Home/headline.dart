import 'package:flutter/material.dart';
import 'package:hack_west/Home/Headline/HeadlinePage.dart';

class Headline extends StatefulWidget {
  Headline({super.key});

  @override
  State<Headline> createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(170, 170, 170, 1),
            Color.fromRGBO(86, 79, 79, 1)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          // Icon in the background
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Icon(
                Icons.article,
                color: Color.fromRGBO(
                    35, 15, 54, 0.5), // Light color for the background
                size: 100, // Bigger size for the background icon
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              'Headline',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0), // Text color
                fontSize: 24, // Font size for the genre name
                fontWeight: FontWeight.bold, // Bold font
              ),
            ),
          ),
          // TextButton for interaction
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Headlinepage(), // Navigating to SavedPage
                          ),
                        );},
              ),
            ),
          ),
        ],
      ),
      // Genre name at the top lef
    );
  }
}
