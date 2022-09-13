import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../graphql/client.dart';
import '../graphql/queries/page.graphql.dart';
import '../sections.dart';
import 'featured.dart';

class BccmPage extends ConsumerStatefulWidget {
  const BccmPage({Key? key, required String code}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PageState();
}

class _PageState extends ConsumerState<BccmPage> {
  late Future<Query$Page$page?> pageFuture;

  @override
  void initState() {
    super.initState();
    final client = ref.read(gqlClientProvider);

    pageFuture = client
        .query$Page(
      Options$Query$Page(
        variables: Variables$Query$Page(code: 'frontpage'),
      ),
    )
        .onError((error, stackTrace) {
      1;
      throw Error();
    }).then((value) {
      if (value.hasException) {
        throw ErrorDescription(value.exception.toString());
      }
      return value.parsedData?.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Query$Page$page?>(
      future: pageFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var sections = snapshot.data!.sections.items
              .where(
                (element) => element is Fragment$ItemSection,
              )
              .map((s) => ItemSection.fromSection(
                  context, s as Fragment$ItemSection, ref))
              .toList();
          return ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              const Featured(),
              Column(
                children: [...sections],
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Text("other error");
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
