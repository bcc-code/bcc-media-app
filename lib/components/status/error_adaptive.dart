import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/api/brunstadtv.dart';
import 'package:brunstadtv_app/components/status/error_generic.dart';
import 'package:brunstadtv_app/components/status/error_no_access.dart';
import 'package:brunstadtv_app/components/status/error_not_found.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

class ErrorAdaptive extends StatelessWidget {
  const ErrorAdaptive({
    super.key,
    this.exception,
    required this.onRetry,
  });

  final Exception? exception;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    Widget? errorWidget;
    final operationException = exception?.asOrNull<OperationException>();
    if (operationException != null) {
      if (ApiErrorCodes.isNoAccess(operationException) || ApiErrorCodes.isNotPublished(operationException)) {
        errorWidget = const ErrorNoAccess();
      } else if (ApiErrorCodes.isNotFound(operationException)) {
        errorWidget = const ErrorNotFound();
      }
    }

    return errorWidget ?? ErrorGeneric(onRetry: onRetry);
  }
}
