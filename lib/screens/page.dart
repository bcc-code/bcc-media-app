import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../components/nav/custom_back_button.dart';
import '../components/pages/page_renderer.dart';
import 'package:bccm_core/platform.dart';

@RoutePage()
class PageScreen extends HookConsumerWidget {
  final String pageCode;

  const PageScreen({
    super.key,
    @PathParam() required this.pageCode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageFuture = useState<Future<Query$Page$page>?>(null);
    useEffect(() {
      pageFuture.value = ref.read(apiProvider).getPage(pageCode);
    }, [pageCode]);

    final pageSnapshot = useFuture(pageFuture.value);

    ref.keepAlive(widgetTitleProvider(hashCode));
    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ref.read(widgetTitleProvider(hashCode).notifier).state = pageSnapshot.data?.title;
        debugPrint('PageScreen ($hashCode), title: ${pageSnapshot.data?.title}');
      });
    }, [pageSnapshot.data?.title, hashCode]);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: kIsWeb ? 300 : 92,
        leading: const Padding(padding: EdgeInsets.only(left: kIsWeb ? 64 : 0), child: CustomBackButton()),
        title: Text(pageSnapshot.data?.title ?? ''),
      ),
      body: PageRenderer(
        pageFuture: pageFuture.value,
        onRefresh: ({bool? retry}) async {
          pageFuture.value = ref.read(apiProvider).getPage(pageCode);
          await pageFuture.value;
        },
      ),
    );
  }
}
