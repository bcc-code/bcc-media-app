import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/helpers/page_mixin.dart';
import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/custom_back_button.dart';
import '../helpers/btv_buttons.dart';
import '../components/general_app_bar.dart';
import '../components/page.dart';
import '../graphql/client.dart';
import '../graphql/queries/page.graphql.dart';
import '../helpers/btv_typography.dart';

class PageScreen extends ConsumerStatefulWidget {
  final String pageCode;

  PageScreen({
    Key? key,
    @PathParam() required this.pageCode,
  }) : super(key: key ?? GlobalKey<PageScreenState>());

  @override
  ConsumerState<PageScreen> createState() => PageScreenState();
}

class PageScreenState extends ConsumerState<PageScreen> with PageMixin {
  String pageTitle = '';

  @override
  void initState() {
    super.initState();

    pageResult = wrapInCompleter(getPage());

    pageResult.future.then((pageData) {
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
      appBar: AppBar(
        leadingWidth: 92,
        leading: const CustomBackButton(),
        title: Text(pageTitle),
      ),
      body: BccmPage(
        pageFuture: pageResult.future,
        onRefresh: ({bool? retry}) async {
          var future = getPage();
          setState(() {
            pageResult = wrapInCompleter(future);
          });
          await future;
        },
      ),
    );
  }
}
