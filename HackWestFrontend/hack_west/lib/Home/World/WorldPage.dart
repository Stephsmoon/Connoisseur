import 'package:flutter/material.dart';
import 'package:hack_west/Home/category.dart';
import 'package:hack_west/News/sample.dart';

class Worldpage extends StatefulWidget {
  const Worldpage({super.key});

  @override
  State<Worldpage> createState() => _WorldpageState();
}

class _WorldpageState extends State<Worldpage> {
  @override
  Widget build(BuildContext context) {
    return Category(title: 'World News', data: listData,);
  }
}