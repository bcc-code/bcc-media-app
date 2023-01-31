import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/page.dart';
import 'package:brunstadtv_app/models/scroll_screen.dart';
import 'package:brunstadtv_app/providers/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../graphql/queries/page.graphql.dart';
import '../../helpers/btv_colors.dart';
import '../../helpers/btv_typography.dart';
import '../../l10n/app_localizations.dart';
import './search_results_page.dart';
import '../../components/search_bar.dart';

class SearchScreen extends ConsumerStatefulWidget {
  final String? query;

  const SearchScreen({Key? key, @QueryParam('q') this.query}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => SearchScreenState();
}

class SearchScreenState extends ConsumerState<SearchScreen> implements ScrollScreen {
  var focusing = false;
  String? _curSearchValue;
  late Future<Query$Page$page> pageFuture;
  final pageScrollController = ScrollController();

  clear() {
    _onSearchInputChanged(null);
  }

  void _onSearchInputChanged(String? input) {
    WidgetsBinding.instance.scheduleFrameCallback((d) {
      setState(() {
        _curSearchValue = input;
      });
    });
  }

  @override
  void scrollToTop() {
    pageScrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.easeOutExpo);
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
    if (oldWidget.query != widget.query) {
      processQueryParam();
    }
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
    String? queryParam = widget.query?.trim();
    if (queryParam?.isEmpty == true) {
      return;
    }
    if (_curSearchValue != queryParam) {
      setState(() {
        _curSearchValue = queryParam;
      });
    }
  }

  getNoInputInfoWidget(context) => Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            S.of(context).emptySearch,
            textAlign: TextAlign.center,
            style: BtvTextStyles.body1.copyWith(color: BtvColors.label3),
          ),
        ),
      );

  Widget get mainContent {
    if (_curSearchValue?.isEmpty == true && focusing) {
      return getNoInputInfoWidget(context);
    } else if (_curSearchValue?.isNotEmpty == true) {
      return SearchResultsPage(_curSearchValue!);
    } else {
      return BccmPage(
        pageFuture: pageFuture,
        onRefresh: ({bool? retry}) async {
          setState(() {
            pageFuture = getSearchPage();
          });
        },
        scrollController: pageScrollController,
      );
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
                onFocusChanged: (val) {
                  if (!val) {
                    setState(() {
                      focusing = false;
                    });
                  } else {
                    // This is just to avoid some visual glitches with the _noInputInfoWidget.
                    Future.delayed(const Duration(milliseconds: 100)).whenComplete(() => setState(() {
                          focusing = true;
                        }));
                  }
                },
                currentValue: _curSearchValue,
                onInputChange: _onSearchInputChanged,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: const Divider(height: 1, color: BtvColors.separatorOnLight),
              ),
              Expanded(
                child: AnimatedSwitcher(duration: const Duration(milliseconds: 100), child: mainContent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
