import 'package:flutter/material.dart';
import 'package:hack_west/Home/category.dart';
import 'package:hack_west/News/sample.dart';

class Financepage extends StatefulWidget {
  const Financepage({super.key});

  @override
  State<Financepage> createState() => _FinancepageState();
}

class _FinancepageState extends State<Financepage> {
  @override
  Widget build(BuildContext context) {
    return Category(title: 'Finance', data: listData,);
  }
}