import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/pages/page_mixin.dart';
import 'package:bccm_core/bccm_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/nav/custom_back_button.dart';
import '../components/pages/page_renderer.dart';
import 'package:bccm_core/api.dart';

@RoutePage<void>()
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
        leadingWidth: kIsWeb ? 300 : 92,
        leading: const Padding(padding: EdgeInsets.only(left: kIsWeb ? 64 : 0), child: CustomBackButton()),
        title: Text(pageTitle),
      ),
      body: PageRenderer(
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
