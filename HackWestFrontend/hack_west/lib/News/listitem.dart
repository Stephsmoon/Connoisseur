import 'package:flutter/material.dart';
import 'custom_bottom_nav.dart';
import 'package:hack_west/Saved/savedlist.dart'; // Import the custom bottom nav

class ListItem extends StatefulWidget {
  final String title;
  final String text;

  ListItem({super.key, required this.title, required this.text});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  Color heartColor = Colors.white;
  List<String> titleList = savedList.map((item) => item.title).toList();

  @override
  void initState() {
    super.initState();
    // Check if the article is already saved when the page is opened
    if (titleList.contains(widget.title)) {
      heartColor = Colors.red; // Set heart color to red if already saved
    } else if (titleList.contains(widget.title)) {
      heartColor = Colors.white;
    }
  }

  void _saveArticle() {
    if (!titleList.contains(widget.title)) {
      save(widget.title, widget.text);
      setState(() {
        heartColor = Colors.red;
      });
    } else if (titleList.contains(widget.title)) {
      delete(widget.title, widget.text);
      setState(() {
        heartColor = Colors.white;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom app bar with centered title and icons
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 105, 180), // Hot pink
                Color(0xFFFE8C00), // Sunset orange
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: heartColor),
            onPressed: () {
              _saveArticle();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch content
          children: [
            // Background image with gradient overlay
            Stack(
              children: [
                Image.network(
                  'https://scontent-dfw5-2.xx.fbcdn.net/v/t39.30808-1/299977045_382750267346610_8519895368913081470_n.jpg?stp=dst-jpg_s480x480&_nc_cat=107&ccb=1-7&_nc_sid=f4b9fd&_nc_ohc=QLThMXPxGpMQ7kNvgFwvukW&_nc_ht=scontent-dfw5-2.xx&_nc_gid=AUkVncyJqcQHSUAB2qfeUQV&oh=00_AYAqpGp8-75fAK0fvCRbv-OGA7j0g257Ed-NBMCcwnmBcw&oe=66ECB6B6',
                    width: double.infinity,
                  height: 500,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 4,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ],
            ),
            // Text content with modern style
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      height: 1.5,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Enhanced Share Button with gradient background
                  GestureDetector(
                    onTap: () {
                      // Placeholder for sharing functionality
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.purple, Colors.pinkAccent],
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.share, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Share this news',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // More engaging content with icon and interaction
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.thumb_up, color: Colors.pinkAccent),
                        onPressed: () {
                          // Handle like functionality
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.bookmark, color: Colors.purple),
                        onPressed: () {
                          // Handle bookmark functionality
                        },
                      ),
                      Text(
                        'Engage with this content',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Use the reusable CustomBottomNavigationBar
    );
  }
}
