import 'package:bccm_core/bccm_core.dart';
import 'package:brunstadtv_app/components/surveys/survey_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/brunstadtv.dart';
import 'package:bccm_core/platform.dart';
import '../../../l10n/app_localizations.dart';
import 'package:bccm_core/design_system.dart';

import '../../providers/surveys.dart';
import '../status/loading_indicator.dart';
import 'dialog_confirm_cancel.dart';
import 'survey_form.dart';

Future<void> openBottomSheetSurvey(BuildContext context, Fragment$Survey survey) {
  CustomHapticFeedback.mediumImpact();
  return showModalBottomSheet(
    context: context,
    useRootNavigator: false,
    isScrollControlled: true,
    useSafeArea: true,
    isDismissible: true,
    builder: (context) => BottomSheetSurvey(survey),
  );
}

class BottomSheetSurvey extends HookWidget {
  final Fragment$Survey survey;

  const BottomSheetSurvey(this.survey, {super.key});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    final completed = useState(false);
    final hasStarted = useState(false);

    void onClose() {
      Navigator.pop(context);
    }

    void onCancel() async {
      final curFocusScope =
          FocusScope.of(context); // Fix glitch with keyboard popping up and down quickly when survey is closed by interacting with the dialog.
      curFocusScope.unfocus();

      if (completed.value || !hasStarted.value) {
        Navigator.pop(context);
        return;
      }

      final cancelConfirmed = await showDialog<bool>(
        context: context,
        builder: (context) => const DialogConfirmCancel(),
      );

      if (cancelConfirmed == true) {
        if (context.mounted) {
          Navigator.pop(context);
        }
      } else {
        curFocusScope.requestFocus();
      }
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (v, r) {
        if (v) return;
        onCancel();
      },
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: Container(
            decoration: BoxDecoration(
              color: design.colors.background1,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: UnconstrainedBox(
                      child: Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: design.colors.label4,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      survey.title,
                      textAlign: TextAlign.center,
                      style: design.textStyles.title3,
                    ),
                  ),
                  Flexible(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _BottomSheetBody(
                        survey: survey,
                        onClose: () => onClose(),
                        onCancel: () => onCancel(),
                        onComplete: () => completed.value = true,
                        hasStarted: hasStarted,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomSheetBody extends ConsumerStatefulWidget {
  final Fragment$Survey survey;
  final VoidCallback onClose;
  final VoidCallback onCancel;
  final VoidCallback onComplete;
  final ValueNotifier<bool> hasStarted;

  const _BottomSheetBody({
    required this.survey,
    required this.onClose,
    required this.onCancel,
    required this.onComplete,
    required this.hasStarted,
  });

  @override
  ConsumerState<_BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends ConsumerState<_BottomSheetBody> {
  List<SurveyAnswer>? surveyAnswers;
  Future? surveySubmissionFuture;

  void submitSurvey(List<SurveyAnswer> answers) {
    final api = ref.read(apiProvider);
    final completedSurveysNotifier = ref.read(completedSurveysProvider.notifier);
    List<Future> futures = [];
    for (var answer in answers) {
      if (answer is SurveyAnswerRating) {
        futures.add(api.sendSurveyAnswerRating(answer.id, answer.rating));
      } else if (answer is SurveyAnswerText) {
        futures.add(api.sendSurveyAnswerText(answer.id, answer.answer));
      }
    }
    setState(() {
      surveySubmissionFuture = Future.wait(futures, eagerError: true).then((value) {
        completedSurveysNotifier.addSurvey(widget.survey.id);
        widget.onComplete();
        return value;
      });
    });
  }

  void onSubmitSurvey(List<SurveyAnswer> answers) {
    surveyAnswers = answers;
    submitSurvey(answers);
  }

  void onTryAgain() {
    if (surveyAnswers == null) {
      return;
    }
    submitSurvey(surveyAnswers!);
  }

  @override
  Widget build(BuildContext context) {
    final linkSurvey = widget.survey.questions.items.firstWhere((question) {
      return question.$__typename == 'SurveyLinkQuestion';
    }).asOrNull<Fragment$SurveyQuestion$$SurveyLinkQuestion>();
    if (linkSurvey != null) {
      return SurveyLink(
        title: linkSurvey.title,
        description: linkSurvey.description,
        url: linkSurvey.url,
        actionButtonText: linkSurvey.actionButtonText,
        cancelButtonText: linkSurvey.cancelButtonText,
        onCancel: widget.onClose,
      );
    }
    if (surveySubmissionFuture == null) {
      return SurveyForm(
        survey: widget.survey,
        onSubmit: onSubmitSurvey,
        onCancel: widget.onCancel,
        hasStarted: widget.hasStarted,
      );
    }
    return simpleFutureBuilder(
      future: surveySubmissionFuture,
      loading: () => _Sending(),
      ready: (value) => _Success(onClose: widget.onClose),
      error: (error) => _Failure(onCancel: widget.onCancel, onTryAgain: onTryAgain),
    );
  }
}

class _Sending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      alignment: Alignment.center,
      child: const LoadingIndicator(),
    );
  }
}

class _Success extends StatelessWidget {
  final VoidCallback onClose;
  const _Success({required this.onClose});

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 146,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(S.of(context).thankYou, style: design.textStyles.title2),
              ),
              Text(S.of(context).sendSuccessDescription, style: design.textStyles.body1),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: double.infinity,
          child: design.buttons.large(
            variant: ButtonVariant.secondary,
            labelText: S.of(context).close,
            onPressed: onClose,
          ),
        )
      ],
    );
  }
}

class _Failure extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onTryAgain;

  const _Failure({
    required this.onCancel,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    final design = DesignSystem.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 146,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Text(S.of(context).sendFail, style: design.textStyles.title2),
              ),
              Text(S.of(context).sendFailDescription, style: design.textStyles.body1, textAlign: TextAlign.center),
            ],
          ),
        ),
        Container(
          height: 52,
          margin: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                child: design.buttons.large(
                  variant: ButtonVariant.secondary,
                  labelText: S.of(context).cancel,
                  onPressed: onCancel,
                ),
              ),
              Expanded(
                child: design.buttons.large(
                  labelText: S.of(context).tryAgainButton,
                  onPressed: onTryAgain,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
