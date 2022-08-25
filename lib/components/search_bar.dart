import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color.fromARGB(255, 29, 40, 56)),
      child: const TextField(
        decoration: InputDecoration(
            isDense: true,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 5),
              child: Icon(Icons.search, size: 25),
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 0, maxHeight: 25),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
                color: Color(0x00707c8e),
                fontFamily: 'Barlow',
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
