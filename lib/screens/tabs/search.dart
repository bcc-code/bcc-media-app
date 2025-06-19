import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/pages/page_renderer.dart';
import 'package:brunstadtv_app/providers/session.dart';
import 'package:brunstadtv_app/screens/tabs/tabs_root.dart';
import 'package:brunstadtv_app/providers/tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bccm_core/platform.dart';
import 'package:bccm_core/design_system.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unleash_proxy_client_flutter/id_generator.dart';

import '../../l10n/app_localizations.dart';
import '../../components/search/search_results.dart';
import '../../components/search/custom_search_bar.dart';

@RoutePage()
class SearchScreen extends HookConsumerWidget {
  final String? queryParam;

  const SearchScreen({super.key, @QueryParam('q') this.queryParam});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusing = useState(false);

    Future<Query$Page$page> getSearchPage() async {
      final api = ref.read(apiProvider);
      return ref.read(appConfigFutureProvider).then((value) {
        final code = value.application.searchPage?.code;
        if (code == null) {
          throw ErrorHint('Application config error');
        }
        return api.getPage(code);
      });
    }

    final pageFuture = useState<Future<Query$Page$page>?>(useMemoized(getSearchPage));

    final searchText = useState(queryParam);

    void onSearchInputChanged(String? input) {
      // Start a new search session when search input is emptied
      if (input == null || input.isEmpty) {
        ref.read(sessionProvider.notifier).state = Session(
          sessionId: ref.read(sessionProvider).sessionId,
          searchSessionId: generateId(),
        );
      }
      WidgetsBinding.instance.scheduleFrameCallback((d) {
        searchText.value = input;
      });
    }

    // Update search text when queryParam changes
    useEffect(() {
      String? q = queryParam?.trim();
      if (q?.isEmpty == true) {
        return;
      }
      if (searchText.value != q) {
        searchText.value = q;
      }
    }, [queryParam]);

    // Clear search text when clicking tab
    useEffect(() {
      final listener = globalEventBus.on<TabClickedEvent>().where((e) => e.tabId == TabId.search).listen((event) {
        searchText.value = null;
      });
      return listener.cancel;
    });

    Widget getMainWidget() {
      if (searchText.value?.isEmpty == true && focusing.value) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              S.of(context).emptySearch,
              textAlign: TextAlign.center,
              style: DesignSystem.of(context).textStyles.body1.copyWith(color: DesignSystem.of(context).colors.label3),
            ),
          ),
        );
      } else if (searchText.value?.isNotEmpty == true) {
        return SearchResults(searchText.value!);
      } else {
        return PageRenderer(
          pageFuture: pageFuture.value,
          onRefresh: ({bool? retry}) async {
            pageFuture.value = getSearchPage();
          },
          scrollController: ref.watch(tabInfosProvider.select((tabInfos) => tabInfos.search.scrollController)),
        );
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: kIsWeb ? 12 : 8, right: kIsWeb ? 80 : 16, left: kIsWeb ? 80 : 16),
                child: CustomSearchBar(
                  onFocusChanged: (val) async {
                    if (!val) {
                      focusing.value = false;
                    } else {
                      if (context.mounted) {
                        searchText.value = '';
                        focusing.value = true;
                      }
                    }
                  },
                  currentValue: searchText.value,
                  onInputChange: onSearchInputChanged,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Divider(height: 1, color: DesignSystem.of(context).colors.separatorOnLight),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: getMainWidget(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
