import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/page.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../helpers/btv_colors.dart';
import './search_home_page.dart';
import './search_results_page.dart';

import '../../components/search_bar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final String? query;

  const SearchScreen({Key? key, @QueryParam('q') this.query}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  var _inSearchMode = false;
  String? _curSearchValue;
  String? searchPrefillValue;
  late Future<Query$Page$page> pageFuture;

  _onSearchModeChanged(bool mode) {
    setState(() {
      _inSearchMode = mode;
    });
  }

  _onSearchInputChanged(String input) {
    setState(() {
      _curSearchValue = input;
      searchPrefillValue = null;
    });
  }

  @override
  void initState() {
    super.initState();
    processQueryParam();
    pageFuture = getSearchPage();
  }

  @override
  void didUpdateWidget(SearchScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    processQueryParam();
  }

  Future<Query$Page$page> getSearchPage() async {
    final api = ref.read(apiProvider);
    return ref.read(appConfigProvider).then((value) {
      final code = value?.application.searchPage?.code;
      if (code == null) {
        throw ErrorHint('Application config error');
      }
      return api.getPage(code);
    });
  }

  processQueryParam() {
    String? queryParam;
    if (widget.query != null && widget.query!.trim().isNotEmpty) {
      queryParam = widget.query;
    }
    /* 
      `searchPrefillValue` should be non-null only if this cycle
       is triggered due to a change in query parameter
    */
    if (_curSearchValue != queryParam) {
      searchPrefillValue = queryParam;
      _curSearchValue = searchPrefillValue;
      _inSearchMode = true;
    } else {
      searchPrefillValue = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SearchBar(
                onModeChange: _onSearchModeChanged,
                onInputChange: _onSearchInputChanged,
                initialQuery: searchPrefillValue,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child:
                    const Divider(height: 1, color: BtvColors.seperatorOnLight),
              ),
              Expanded(
                child: _inSearchMode
                    ? SearchResultsPage(_curSearchValue)
                    : BccmPage(
                        pageFuture: pageFuture,
                        onRefresh: () async {
                          setState(() {
                            pageFuture = getSearchPage();
                          });
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
