import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../helpers/btv_colors.dart';
import './search_home_page.dart';
import './search_results_page.dart';

import '../../components/search_bar.dart';

class SearchScreen extends StatefulWidget {
  final String? query;

  const SearchScreen({Key? key, @QueryParam('q') this.query}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var _inSearchMode = false;
  String? _curSearchValue;
  String? queryParam;

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
  void initState() {
    super.initState();
    processQueryParam();
  }

  @override
  void didUpdateWidget(SearchScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    processQueryParam();
  }

  processQueryParam() {
    if (widget.query != null && widget.query!.trim().isEmpty) {
      queryParam = null;
    } else {
      queryParam = widget.query;
    }
    if (queryParam != null) {
      _curSearchValue = queryParam;
      _inSearchMode = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('--- HELLO ---');
    final searchScreen = Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchBar(
              onModeChange: _onSearchModeChanged,
              onInputChange: _onSearchInputChanged,
              initialQuery: queryParam,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child:
                  const Divider(height: 1, color: BtvColors.seperatorOnLight),
            ),
            Expanded(
              child: _inSearchMode
                  ? SearchResultsPage(_curSearchValue)
                  : SearchHomePage(),
            ),
          ],
        ),
      ),
    );
    queryParam = null;
    return searchScreen;
  }
}
