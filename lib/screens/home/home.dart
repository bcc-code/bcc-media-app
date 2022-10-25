import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:bccm_player/cast_button.dart';
import '../../graphql/client.dart';
import '../../graphql/queries/page.graphql.dart';
import '../../router/router.gr.dart';
import '../../components/general_app_bar.dart';
import '../../components/icon_label_button.dart';
import '../../components/page/page.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<Query$Page$page?> resultFuture;

  @override
  void initState() {
    super.initState();

    final client = ref.read(gqlClientProvider);

    resultFuture = client
        .query$Page(
      Options$Query$Page(variables: Variables$Query$Page(code: 'frontpage')),
    )
        .then(
      (value) {
        if (value.hasException) {
          throw ErrorDescription(value.exception.toString());
        }
        return value.parsedData?.page;
      },
    ).catchError(
      (error) {
        print(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = GeneralAppBar(
      title: Image.asset('assets/icons/Logo.png'),
      leftActions: [
        IconLabelButton(
          imagePath: 'assets/icons/Profile.png',
          onPressed: () => context.router.push(const ProfileRoute()),
        )
      ],
      rightActions: const [
        SizedBox.square(dimension: 24, child: CastButton()),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: BccmPage(pageFuture: resultFuture),
    );
  }
}
