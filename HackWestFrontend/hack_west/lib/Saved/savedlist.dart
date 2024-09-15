import 'package:flutter/material.dart';

class Savedlist {
  final String title;
  final String text;

  Savedlist(this.title, this.text);
}

// Sample Data
List<Savedlist> savedList = [
];

// Function to add new data at the top
void save(String title, String text) {
  savedList.add(Savedlist(title, text));
}

void delete(String title, String text) {
  savedList.removeWhere((item) => item.title == title && item.text == text);
}
