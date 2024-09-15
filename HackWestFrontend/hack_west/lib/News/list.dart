import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'listitem.dart';
import 'sample.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, String>> fetchedData = []; // List to hold the fetched data

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
          fetchedData = tempList;
          _isLoading = false; // Stop loading when data is fetched
        });
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur
      print('Error: $e');
    }
  }

  bool _isRefreshing = false;
  bool _isLoading = true; // Initial loading state

  @override
  void initState() {
    super.initState();
    fetchData(); // Call fetch function when the page starts
  }

  Future<void> _refresh() async {
    setState(() {
      _isRefreshing = true;
    });
    await fetchData(); // Fetch data when refreshed
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: FaIcon(
              FontAwesomeIcons.egg, // Font Awesome Egg icon
              size: 100,
              color: Colors.orange,
            ),
          ),
          _isLoading
              ? Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.orange,
                    size: 70,
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                    itemCount: fetchedData.length,
                    itemBuilder: (context, index) {
                      final element = fetchedData[index];
                      return Stack(
                        children: [
                          Container(
                            height:  MediaQuery.of(context).size.height * 0.7,
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
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.5,
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
                ),
        ],
      ),
    );
  }
}
