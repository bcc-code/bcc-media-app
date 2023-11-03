import 'package:auto_route/auto_route.dart';
import 'package:brunstadtv_app/helpers/constants.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AnalyticsPageCodes {
  const AnalyticsPageCodes._();
  static const String signup = 'signup';
  static const String signupEmail = 'signup-email';
  static const String signupPassword = 'signup-password';
  static const String signupName = 'signup-name';
  static const String signupBirthdate = 'signup-birthdate';
  static const String signupDone = 'signup-done';
  static const String verifyEmail = 'verify-email';
}

String? analyticsNameForRouteName(BuildContext context, String pageName) {
  return context.router.matcher.collection.routes.firstWhereOrNull((element) => element.name == pageName)?.meta[RouteMetaConstants.analyticsName];
}
