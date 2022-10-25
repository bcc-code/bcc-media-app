import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/icon_label_button.dart';
import '../components/general_app_bar.dart';
import '../components/page/page.dart';
import '../graphql/client.dart';
import '../graphql/queries/page.graphql.dart';

class PageScreen extends ConsumerStatefulWidget {
  final String pageCode;

  const PageScreen({
    super.key,
    @PathParam() required this.pageCode,
  });

  @override
  ConsumerState<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends ConsumerState<PageScreen> {
  late Future<Query$Page$page?> resultFuture;
  String pageTitle = '';

  @override
  void initState() {
    super.initState();

    final client = ref.read(gqlClientProvider);

    resultFuture = client
        .query$Page(
      Options$Query$Page(
          variables: Variables$Query$Page(code: widget.pageCode)),
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

    resultFuture.then((value) {
      if (value != null) {
        setState(() => pageTitle = value.title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: Text(
          pageTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leftActions: [
          IconLabelButton(
            imagePath: 'assets/icons/Left.png',
            labelText: 'Home',
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
      body: BccmPage(
        pageFuture: resultFuture,
      ),
    );
  }
}
