import 'package:flutter/material.dart';

class GenreButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color startColor;
  final Color endColor;
  final String genreName;
  final VoidCallback onPressed; // Updated to VoidCallback

  const GenreButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.startColor,
    required this.endColor,
    required this.genreName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
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
                  icon,
                  color: iconColor.withOpacity(0.5), // Light color for the background
                  size: 100, // Bigger size for the background icon
                ),
              ),
            ),
            // Genre name at the top left
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                genreName,
                style: const TextStyle(
                  color: Colors.black, // Text color
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
                  onTap: onPressed, // Call the function on tap
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
