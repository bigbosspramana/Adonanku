import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String text;

  const SearchButton({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: text,
            filled: true,
            fillColor: const Color.fromARGB(255, 250, 250, 250),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: Color(0xFF929292),
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              borderSide: BorderSide(
                color: Color(0xFF11695B),
                width: 0.52,
              ),
            ),
            suffixIcon: Icon(Icons.search),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ),
    );
  }
}
