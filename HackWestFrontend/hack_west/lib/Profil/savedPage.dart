import 'package:flutter/material.dart';
import 'package:hack_west/Saved/savedlist.dart';
import 'package:hack_west/News/listitem.dart';

class Savedpage extends StatefulWidget {
  const Savedpage({super.key});

  @override
  State<Savedpage> createState() => _SavedpageState();
}

class _SavedpageState extends State<Savedpage> {
  final List<String> _items = List.generate(20, (index) => 'Item $index');
  final lengthList = savedList.length;
  @override
  Widget build(BuildContext context) {
    if (savedList.isEmpty) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Saved Articles'),
          ),
          body: Center(
            child: Text(
              'No saved Article',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Saved Articles'),
          ),
          body: ListView.separated(
            itemCount: lengthList,
            itemBuilder: (context, index) {
              final element = savedList[index];
              return Stack(
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Image.network(
                      'https://i.pinimg.com/1200x/48/24/93/48249335e8c3852d59a5a27e054bb8d2.jpg',
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      element.title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Container(
                      padding: const EdgeInsets.all(8.0),
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.2,
                      ),
                      child: SingleChildScrollView(
                        child: Text(
                          element.text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListItem(
                            title: element.title,
                            text: element.text,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
              thickness: 4.0,
            ),
          ),
        ),
      );
    }
  }
}
