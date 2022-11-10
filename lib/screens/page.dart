import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/btv_buttons.dart';
import '../components/general_app_bar.dart';
import '../components/page.dart';
import '../graphql/client.dart';
import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_typography.dart';

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
  late Future<Query$Page$page> resultFuture;
  String pageTitle = '';

  @override
  void initState() {
    super.initState();

    resultFuture = getPage();

    resultFuture.then((pageData) {
      if (mounted) {
        setState(() => pageTitle = pageData.title);
      }
    });
  }

  Future<Query$Page$page> getPage() {
    return ref.read(apiProvider).getPage(widget.pageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: Text(
          pageTitle,
          style: BtvTextStyles.title3,
        ),
        leftActions: [
          BtvButton(
            imagePath: 'assets/icons/Left.png',
            labelText: 'Home',
            onPressed: () => context.router.pop(),
          ),
        ],
      ),
      body: BccmPage(
        pageFuture: resultFuture,
        onRefresh: () async {
          var future = getPage();
          setState(() {
            resultFuture = future;
          });
          await future;
        },
      ),
    );
  }
}
