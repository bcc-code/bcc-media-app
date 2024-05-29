import 'package:auto_route/auto_route.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/contributions/contributions_list.dart';
import 'package:brunstadtv_app/components/nav/custom_back_button.dart';
import 'package:brunstadtv_app/components/profile/avatar.dart';
import 'package:brunstadtv_app/components/status/loading_generic.dart';
import 'package:bccm_core/platform.dart';
import 'package:brunstadtv_app/components/tabs/tab_selector.dart';
import 'package:brunstadtv_app/l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../components/status/error_generic.dart';
import 'package:bccm_core/design_system.dart';

@RoutePage<void>()
class ContributorScreen extends HookConsumerWidget {
  const ContributorScreen({
    Key? key,
    @PathParam() required this.personId,
  }) : super(key: key);

  final String personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = DesignSystem.of(context);

    final personQuery = useQuery$GetPerson(
      Options$Query$GetPerson(variables: Variables$Query$GetPerson(id: personId), fetchPolicy: FetchPolicy.networkOnly),
    );
    final person = personQuery.result.parsedData?.person;

    if (personQuery.result.isLoading && person == null) {
      return const Scaffold(body: LoadingGeneric());
    }

    if (person == null) {
      final exception = personQuery.result.exception;
      return Scaffold(
        body: ErrorGeneric(
          onRetry: personQuery.refetch,
          details: exception?.toString(),
        ),
      );
    }

    final filterTabs = <({String name, String? typeCode})>[
      (name: S.of(context).seeAll, typeCode: null),
      ...person.contributionTypes.map((t) => (name: t.type.title, typeCode: t.type.code))
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: filterTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const CustomBackButton(),
          leadingWidth: 92,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPadding(
              padding: const EdgeInsets.all(16).copyWith(top: 8),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Column(
                    children: [
                      Avatar(
                        imageUrl: person.image,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 16),
                        child: Text(
                          person.name,
                          style: design.textStyles.title1,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1, color: DesignSystem.of(context).colors.separatorOnLight)),
                        ),
                        child: HookBuilder(
                          builder: (context) {
                            final tabController = DefaultTabController.of(context);
                            useListenable(tabController);
                            return TabSelector(
                              tabs: filterTabs.map((f) => f.name).toList(),
                              selectedIndex: tabController.index,
                              onSelectionChange: (newIndex) => tabController.index = newIndex,
                              padding: const EdgeInsets.only(top: 16, bottom: 8),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: filterTabs
                .mapIndexed(
                  (i, f) => SectionAnalytics(
                    data: SectionAnalyticsData(
                      id: '',
                      position: i,
                      type: 'ContributorList',
                      name: person.name,
                      pageCode: 'person',
                      meta: {
                        'personId': person.id,
                        'type': f.typeCode,
                      },
                    ),
                    builder: (context) => ContributionsList(personId: person.id, type: f.typeCode),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
