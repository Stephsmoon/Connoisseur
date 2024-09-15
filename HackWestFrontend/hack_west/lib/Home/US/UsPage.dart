import 'package:flutter/material.dart';
import 'package:hack_west/Home/category.dart';
import 'package:hack_west/News/sample.dart';

class Uspage extends StatefulWidget {
  const Uspage({super.key});

  @override
  State<Uspage> createState() => _UspageState();
}

class _UspageState extends State<Uspage> {
  @override
  Widget build(BuildContext context) {
    return Category(title: 'US Politics', data: listData,);
  }
}