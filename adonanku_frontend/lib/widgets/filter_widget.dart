import 'package:adonanku_frontend/helper/filter_helper.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final FilterHelper filter;

  const FilterWidget({required this.filter, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 5, right: filter.marright),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: Color(0xFF929292), // Warna border
            width: 0.5, // Ketebalan border
          ),
        ),
        child: Text(filter.nama));
  }
}
