import 'package:brunstadtv_app/helpers/utils.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../api/brunstadtv.dart';
import '../../../graphql/queries/prompts.graphql.dart';
import '../../../helpers/ui/btv_buttons.dart';
import '../../../l10n/app_localizations.dart';
import '../../../theme/bccm_colors.dart';
import '../../../theme/bccm_typography.dart';
import '../../providers/surveys.dart';
import '../loading_indicator.dart';
import 'dialog_confirm_cancel.dart';
import 'survey_form.dart';

class BottomSheetSurvey extends StatelessWidget {
  final Fragment$Prompt$$SurveyPrompt prompt;

  const BottomSheetSurvey(this.prompt, {super.key});

  void onClose(BuildContext context) {
    Navigator.pop(context);
  }

  void onCancel(BuildContext context) {
    final curFocusScope =
        FocusScope.of(context); // Fix glitch with keyboard popping up and down quickly when survey is closed by interacting with the dialog.
    curFocusScope.unfocus();

    Future<bool?> isCancelConfirmed = showDialog(
      context: context,
      builder: (context) => const DialogConfirmCancel(),
    );
    isCancelConfirmed.then((cancelConfirmed) {
      if (cancelConfirmed == true) {
        onClose(context);
      } else {
        curFocusScope.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onCancel(context);
        return false;
      },
      child: AnimatedPadding(
        padding: MediaQuery.of(context).viewInsets,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: const BoxDecoration(
            color: BccmColors.background1,
            borderRadius: BorderRadius.only(
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
                        color: BccmColors.label4,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    prompt.survey.title,
                    textAlign: TextAlign.center,
                    style: BccmTextStyles.title3,
                  ),
                ),
                Flexible(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: _BottomSheetBody(
                      survey: prompt.survey,
                      onClose: () => onClose(context),
                      onCancel: () => onCancel(context),
                    ),
                  ),
                ),
              ],
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

  const _BottomSheetBody({required this.survey, required this.onClose, required this.onCancel});

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
    if (surveySubmissionFuture == null) {
      return SurveyForm(
        surveyQuestions: widget.survey.questions.items,
        onSubmit: onSubmitSurvey,
        onCancel: widget.onCancel,
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
                child: Text(S.of(context).thankYou, style: BccmTextStyles.title2),
              ),
              Text(S.of(context).sendSuccessDescription, style: BccmTextStyles.body1),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          width: double.infinity,
          child: BtvButton.largeSecondary(
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
                child: Text(S.of(context).sendFail, style: BccmTextStyles.title2),
              ),
              Text(S.of(context).sendFailDescription, style: BccmTextStyles.body1, textAlign: TextAlign.center),
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
                child: BtvButton.largeSecondary(
                  labelText: S.of(context).cancel,
                  onPressed: onCancel,
                ),
              ),
              Expanded(
                child: BtvButton.large(
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
