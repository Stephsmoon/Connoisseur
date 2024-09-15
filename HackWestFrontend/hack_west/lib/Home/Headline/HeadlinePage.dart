import 'package:flutter/material.dart';
import 'package:hack_west/Home/category.dart';
import 'package:hack_west/News/sample.dart';

class Headlinepage extends StatefulWidget {
  const Headlinepage({super.key});

  @override
  State<Headlinepage> createState() => _HeadlinepageState();
}

class _HeadlinepageState extends State<Headlinepage> {
  @override
  Widget build(BuildContext context) {
    return Category(title: 'Headline', data: listData,);
  }
}