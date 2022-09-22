import 'package:flutter/material.dart';

import './search_home_page.dart';
import './search_results_page.dart';

import '../../components/search_bar.dart';
import '../../services/auth_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String name = AuthService.instance.parsedIdToken!.name;
  var _inSearchMode = false;
  var _curSearchValue = '';

  _onSearchModeChanged(bool mode) {
    setState(() {
      _inSearchMode = mode;
    });
  }

  _onSearchInputChanged(String input) {
    setState(() {
      _curSearchValue = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBar(
            onModeChange: _onSearchModeChanged,
            onInputChange: _onSearchInputChanged,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: const Divider(
                height: 1, color: Color.fromRGBO(204, 221, 255, 0.1)),
          ),
          Expanded(
            child: _inSearchMode
                ? SearchResultsPage(_curSearchValue)
                : SearchHomePage(),
          ),
        ],
      ),
    );
  }
}
