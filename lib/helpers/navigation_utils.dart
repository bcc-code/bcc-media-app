import 'package:auto_route/auto_route.dart';

extension StackRouterCustomNavigation on StackRouter {
  void navigateNamedFromRoot(String path) {
    var result = root.matcher.match(path, includePrefixMatches: true);
    if (result != null) {
      navigateAll(result);
    }
  }
}

extension ToQueryString on Parameters {
  String toQueryStringWithQuestionMark() {
    if (isEmpty) {
      return '';
    }
    var queryString = '?';
    queryString += rawMap.entries.map((kv) => '${kv.key}=${kv.value}').join('&');
    return queryString;
  }
}

String uriStringWithoutHost(Uri uri) {
  var result = uri.path;
  if (uri.query.isNotEmpty) {
    result += '?${uri.query}';
  }
  if (uri.fragment.isNotEmpty) {
    result += '#${uri.fragment}';
  }
  return result;
}
