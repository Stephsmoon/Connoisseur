import 'package:flutter/material.dart';
import 'topic.dart'; // Ensure GenreButton is properly imported
import 'headline.dart';
import 'Finance/FinancePage.dart';
import 'Headline/HeadlinePage.dart';
import 'Tech/Techpage.dart';
import 'US/UsPage.dart';
import 'World/WorldPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: Color.fromARGB(255, 8, 0, 0),
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Headline(),
          ),
          Container(
            height: MediaQuery.of(context).size.height *
                0.5, // 50% of screen height
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      GenreButton(
                        icon: Icons.gavel,
                        iconColor: Color.fromARGB(255, 2, 20, 29),
                        startColor:
                            Color.fromARGB(255, 255, 105, 180), // Hot pink
                        endColor: Color(0xFFFE8C00),
                        genreName: 'US Politics',
                        onPressed: () {Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Uspage(), // Navigating to SavedPage
                          ),
                        );},
                      ),
                      GenreButton(
                        icon: Icons.public,
                        iconColor: Color.fromARGB(255, 2, 20, 29),
                        startColor:
                            Color.fromARGB(255, 255, 105, 180), // Hot pink
                        endColor: Color(0xFFFE8C00),
                        genreName: 'World',
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Worldpage()
                            ),
                          );},
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      GenreButton(
                        icon: Icons.attach_money,
                        iconColor: Color.fromARGB(255, 2, 20, 29),
                        startColor:
                            Color.fromARGB(255, 255, 105, 180), // Hot pink
                        endColor: Color(0xFFFE8C00),
                        genreName: 'Finance',
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Financepage()
                            ),
                          );},
                      ),
                      GenreButton(
                        icon: Icons.computer,
                        iconColor: Color.fromARGB(255, 2, 20, 29),
                        startColor:
                            Color.fromARGB(255, 255, 105, 180), // Hot pink
                        endColor: Color(0xFFFE8C00),
                        genreName: 'Tech',
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Techpage()
                            ),
                          );},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Add other widgets here if needed
        ],
      ),
    );
  }
}
