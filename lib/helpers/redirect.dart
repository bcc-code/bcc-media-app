import 'package:graphql/client.dart';
import 'package:url_launcher/url_launcher.dart';

import '../graphql/queries/redirect.graphql.dart';

Future performRedirect({required String code, required GraphQLClient gqlClient}) async {
  print('Redirect code: $code');
  if (code.isEmpty) {
    return;
  }
  final result = await gqlClient.query$GetRedirectUrl(
    Options$Query$GetRedirectUrl(
      variables: Variables$Query$GetRedirectUrl(
        id: code,
      ),
    ),
  );
  var urlString = result.parsedData?.redirect.url;
  if (urlString == null) return;
  final uri = Uri.tryParse(urlString);
  if (uri == null) return;
  launchUrl(uri, mode: LaunchMode.externalApplication);
}
