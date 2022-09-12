import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final String searchInput;

  const SearchResultsPage(this.searchInput);

  @override
  Widget build(BuildContext context) {
    return searchInput == ''
        ? Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: const Text(
                'You can search all content from BrunstadTV.  Series, videos and episodes.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(180, 192, 210, 1),
                ),
              ),
            ),
          )
        : ListView(
            children: [Text('Hello')],
          );
  }
}
