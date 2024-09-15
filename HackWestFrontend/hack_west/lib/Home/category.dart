import 'package:flutter/material.dart';
import 'package:hack_west/News/sample.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hack_west/News/listitem.dart';

class Category extends StatefulWidget {
  String title;
  List data;
  Category({super.key, required this.title, required this.data});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Map<String, String>> fetchedData = [];

  Future<void> fetchData() async {
    // Define the URL
    final String url = 'http://10.0.2.2:8000/api/news/';

    try {
      // Send the GET request
      final response = await http.get(Uri.parse(url));

      // Check for a successful response
      if (response.statusCode == 200) {
        // Decode the JSON response
        final List<dynamic> data = json.decode(response.body);

        // Loop through the data and extract title and text
        List<Map<String, String>> tempList = [];
        for (var item in data) {
          String title = item['title'] ?? 'No Title';
          String text = item['text'] ?? 'No Text';

          // Add to tempList
          tempList.add({'title': title, 'text': text});
        }

        // Reverse the list so that the latest item appears first
        tempList = tempList.reversed.toList();

        // Update the state with the reversed list
        setState(() {
          fetchedData = tempList; // Stop loading when data is fetched
        });
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetch function when the page starts
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
      ),
      body: ListView.builder(
        itemCount: fetchedData.length,
        itemBuilder: (context, index) {
          final element = fetchedData[index];
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListTile(
                  title: Text(
                    element['title']!,
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Container(
                    padding: const EdgeInsets.all(8.0),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.5,
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        element['text']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListItem(
                          title: element['title']!,
                          text: element['text']!,
                        ),
                      ),
                    );
                  },
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 0, 0, 0), // Hot pink
                      Color.fromARGB(255, 141, 98, 151), // Sunset orange
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
