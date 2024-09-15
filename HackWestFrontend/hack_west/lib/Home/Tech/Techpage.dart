import 'package:flutter/material.dart';
import 'package:hack_west/Home/category.dart';
import 'package:hack_west/News/sample.dart';

class Techpage extends StatefulWidget {
  const Techpage({super.key});

  @override
  State<Techpage> createState() => _TechpageState();
}

class _TechpageState extends State<Techpage> {
  @override
  Widget build(BuildContext context) {
    return Category(title: 'Tech', data: listData,);
  }
}