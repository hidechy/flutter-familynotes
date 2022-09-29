// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/main_layouts.dart';
import '../../route/route.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/proceed_button.dart';
import '../parent_report/viewmodel/parent_report_user_select_value_viewmodel.dart';
import '../parent_report/viewmodel/parent_report_user_text_value_viewmodel.dart';
import '_components/consul_parent_select_button.dart';
import 'viewmodel/consultation_pulldown_value_viewmodel.dart';
import 'viewmodel/consultation_pulldown_viewmodel.dart';
import 'viewmodel/consultation_select_value_viewmodel.dart';
import 'viewmodel/consultation_user_select_value_viewmodel.dart';
import 'viewmodel/consultation_user_text_value_viewmodel.dart';

class ConsultationScreen extends ConsumerWidget {
  ConsultationScreen({Key? key}) : super(key: key);

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final consultationSelectValueState =
        ref.watch(consultationSelectValueProvider);

    final consultationSelectValueViewModel =
        ref.watch(consultationSelectValueProvider.notifier);

    var consultationPulldownState = <String>[];
    if (consultationSelectValueState != '') {
      consultationPulldownState = ref.watch(
        consultationPulldownProvider(consultationSelectValueState),
      );
    }

    final consultationPulldownValueState =
        ref.watch(consultationPulldownValueProvider);

    final consultationPulldownValueViewModel =
        ref.watch(consultationPulldownValueProvider.notifier);

    //--------------------------- 選択値初期化
    ref.watch(consultationUserSelectValueProvider.notifier).stateClear();

    ref.watch(parentReportUserSelectValueProvider.notifier).stateClear();

    textStateClear();

    //--------------------------- 選択値初期化

    return MainLayouts(
      title: '検診入力選択',
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              '入力する記録を選択',
              style: IHSTextStyle.medium.copyWith(
                color: IHSColors.titleColor,
              ),
            ),
            const SizedBox(height: 24),
            DefaultTextStyle(
              style: IHSTextStyle.small,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: const [
                    Text('入力される検診の記録を選択してください。'),
                    Text('その後、受診予定の検診名をリストから選択してください。'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ConsulParentSelectButton(
                    title: '保護者の記録',
                    name: 'parentReportInput',
                    state: consultationSelectValueState,
                    viewmodelMethod: (String value) =>
                        consultationSelectValueViewModel.setValue(value: value),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ConsulParentSelectButton(
                    title: '診断結果',
                    name: 'consultationInput',
                    state: consultationSelectValueState,
                    viewmodelMethod: (value) =>
                        consultationSelectValueViewModel.setValue(value: value),
                  ),
                ),
              ],
            ),
            if (consultationPulldownState.isNotEmpty)
              Column(
                children: [
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: IHSColors.consultationInputBackgroundColor,
                      border: Border.all(color: Colors.black54),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 24,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        hint: const Text('選択してください'),
                        items: consultationPulldownState.map((result) {
                          return DropdownMenuItem(
                            child: Text(
                              result,
                              style: IHSTextStyle.small,
                            ),
                            value: result,
                          );
                        }).toList(),
                        value: consultationPulldownValueState,
                        onChanged: (Object? value) {
                          consultationPulldownValueViewModel.setValue(
                            value: value.toString(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 24),
            ProceedButton(
              buttonText: '入力画面へ',
              onPress: () {
                //TODO 暫定的にスナックバー、後でアラートウインドウに変更する
                if (consultationSelectValueState == '' ||
                    consultationPulldownValueState == '') {
                  ScaffoldMessenger.of(_context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '入力する記録を選択してください。',
                        style: IHSTextStyle.small.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      duration: const Duration(seconds: 5),
                    ),
                  );

                  return;
                }
                //TODO 暫定的にスナックバー、後でアラートウインドウに変更する

                pageMove();
              },
              usage: 'consultation_screen',
            ),
          ],
        ),
      ),
    );
  }

  void pageMove() {
    final consultationTypeMap = {
      '1か月児健康診査': 'OneMonths',
      '3〜4か月児健康診査': 'ThreeMonths',
      '6〜7か月児健康診査': 'SixMonths',
      '9〜10か月児健康診査': 'NineMonths',
      '1歳児健康診査': 'OneYears',
      '1歳6か月児健康診査': 'OnehalfYears',
      '2歳児健康診査': 'TwoYears',
      '3歳児健康診査': 'ThreeYears'
    };

    final selectedValue = _ref.watch(consultationSelectValueProvider);
    final consultationKind =
        consultationTypeMap[_ref.watch(consultationPulldownValueProvider)];

    if (selectedValue == 'parentReportInput') {
      Navigator.pushNamed(
        _context,
        const RoutePath.parentReportInput().path,
        arguments: {
          'parentReportKind': consultationKind,
        },
      );
      return;
    }

    if (selectedValue == 'consultationInput') {
      Navigator.pushNamed(
        _context,
        const RoutePath.consultationInput().path,
        arguments: {
          'consultationKind': consultationKind,
        },
      );
      return;
    }
  }

  void textStateClear() {
    ////////////////////// consultation
    // base
    final consultationDateState = _ref.watch(consultationDateProvider);
    final consultationYearFromBirthState =
        _ref.watch(consultationYearFromBirthProvider);
    final consultationMonthFromBirthState =
        _ref.watch(consultationMonthFromBirthProvider);
    final consultationHeightState = _ref.watch(consultationHeightProvider);
    final consultationWeightState = _ref.watch(consultationWeightProvider);
    final consultationHeadCircumferenceState =
        _ref.watch(consultationHeadCircumferenceProvider);
    final consultationChestCircumferenceState =
        _ref.watch(consultationChestCircumferenceProvider);

    // memo
    final consultationMemoState = _ref.watch(consultationMemoProvider);

    // detail
    final consultationOphthalmicFindingsFollowupState =
        _ref.watch(consultationOphthalmicFindingsFollowupProvider);
    final consultationEntFindingsFollowupState =
        _ref.watch(consultationEntFindingsFollowupProvider);

    // dental
    final consultationDentalCheckDecayUntreatedState =
        _ref.watch(consultationDentalCheckDecayUntreatedProvider);
    final consultationDentalCheckDecayTreatedState =
        _ref.watch(consultationDentalCheckDecayTreatedProvider);

    // precision
    final consultationPrecisionHealthCheckRequestedDateState =
        _ref.watch(consultationPrecisionHealthCheckRequestedDateProvider);
    final consultationPrecisionHealthCheckDateState =
        _ref.watch(consultationPrecisionHealthCheckDateProvider);

    consultationDateState.text = '';
    consultationYearFromBirthState.text = '';
    consultationMonthFromBirthState.text = '';
    consultationHeightState.text = '';
    consultationWeightState.text = '';
    consultationHeadCircumferenceState.text = '';
    consultationChestCircumferenceState.text = '';
    consultationMemoState.text = '';
    consultationOphthalmicFindingsFollowupState.text = '';
    consultationEntFindingsFollowupState.text = '';
    consultationDentalCheckDecayUntreatedState.text = '';
    consultationDentalCheckDecayTreatedState.text = '';
    consultationPrecisionHealthCheckRequestedDateState.text = '';
    consultationPrecisionHealthCheckDateState.text = '';
    ////////////////////// consultation

    ////////////////////// parentReport

    final parentReportDateState = _ref.watch(parentReportDateProvider);
    final parentReportNeckFixedDateState =
        _ref.watch(parentReportNeckFixedDateProvider);
    final parentReportTossingAndTurningDateState =
        _ref.watch(parentReportTossingAndTurningDateProvider);
    final parentReportSittingAloneDateState =
        _ref.watch(parentReportSittingAloneDateProvider);
    final parentReportCrawlDateState =
        _ref.watch(parentReportCrawlDateProvider);
    final parentReportStandupDateState =
        _ref.watch(parentReportStandupDateProvider);
    final parentReportCrampedWalkDateState =
        _ref.watch(parentReportCrampedWalkDateProvider);
    final parentReportWalkingAloneDateState =
        _ref.watch(parentReportWalkingAloneDateProvider);
    final parentReportFavoritePlayState =
        _ref.watch(parentReportFavoritePlayProvider);
    final parentReportBirthdayMessageState =
        _ref.watch(parentReportBirthdayMessageProvider);
    final parentReportMemoState = _ref.watch(parentReportMemoProvider);
    final parentReportTeethingDateState =
        _ref.watch(parentReportTeethingDateProvider);

    parentReportDateState.text = '';
    parentReportNeckFixedDateState.text = '';
    parentReportTossingAndTurningDateState.text = '';
    parentReportSittingAloneDateState.text = '';
    parentReportCrawlDateState.text = '';
    parentReportStandupDateState.text = '';
    parentReportCrampedWalkDateState.text = '';
    parentReportWalkingAloneDateState.text = '';
    parentReportFavoritePlayState.text = '';
    parentReportBirthdayMessageState.text = '';
    parentReportMemoState.text = '';
    parentReportTeethingDateState.text = '';

    ////////////////////// parentReport
  }
}
