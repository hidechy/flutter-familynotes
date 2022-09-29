// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/main_layouts.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/cancel_button.dart';
import '../_components/proceed_button.dart';
import '_components/base_input.dart';
import '_components/dental_input.dart';
import '_components/detail_input.dart';
import '_components/memo_input.dart';
import '_components/nutrition_input.dart';
import '_components/precision_input.dart';
import '_components/urinalysis_input.dart';
import 'consultation_confirm_screen.dart';
import 'viewmodel/consultation_user_select_value_viewmodel.dart';
import 'viewmodel/consultation_user_text_value_viewmodel.dart';

class ConsultationInputScreen extends ConsumerWidget {
  ConsultationInputScreen({Key? key, required this.consultationKind})
      : super(key: key);
  final String consultationKind;

  Map<String, String> consultationTypeNames = {
    'ThreeMonths': '3〜4か月児健康診査',
    'OnehalfYears': '1歳6か月児健康診査',
    'ThreeYears': '3歳児健康診査'
  };

  Map<String, dynamic> typeValueMap = {};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationUserSelectValueState =
        ref.watch(consultationUserSelectValueProvider);

    final consultationUserSelectValueViewModel =
        ref.watch(consultationUserSelectValueProvider.notifier);

    //TODO 暫定的な選択値

    /*
    var selectValues = {
      "nutrition_check": 0,
      "nutrition_method": 0,
      "nutrition_milk": 0,
      "nutrition_weaning": 0,
      "is_growth_physical": 0,
      "is_growth_mental": 0,
      "is_convulsions": 0,
      "is_motor_function": 0,
      "is_nervous_sensory": 0,
      "is_blood_problem": 0,
      "is_skin_problem": 0,
      "is_hip_joint": 0,
      "is_open_limit": 0,
      "is_torticollis": 0,
      "is_circulatory_system": 0,
      "is_respiratory_system": 0,
      "is_digestive_system": 0,
      "is_genitourinary_system": 0,
      "is_metabolic_system": 0,
      "is_congenital_physical_features": 0,
      "is_fever_convulsions": 0,
      "is_vision_probrem": 0,
      "is_hearing_probrem": 0,
      "is_developmental_smile": 0,
      "is_developmental_pursuit": 0,
      "is_developmental_fixed_neck": 0,
      "is_developmental_turn_direction": 0,
      "is_developmental_grab_toy": 0,
      "is_developmental_sitting": 0,
      "is_developmental_speech": 0,
      "is_developmental_walking_alone": 0,
      "is_developmental_twoword_sentence": 0,
      "is_ophthalmic_both_eyes": 0,
      "is_ophthalmic_right_eye": 0,
      "is_ophthalmic_left_eye": 0,
      "is_ophthalmic_abnormal_position": 0,
      "is_ent_right_ear": 0,
      "is_ent_left_ear": 0,
      "dental_check_decay": 0,
      "is_dental_gingiva": 0,
      "is_dental_engagement": 0,
      "urinalysis_protein": 0,
      "urinalysis_sugar": 0,
      "urinalysis_occult_blood": 0,
      "date": "2022-02-02",
      "facility": "大阪府",
      "yearFromBirth": "5",
      "monthFromBirth": "6",
      "height": "99",
      "weight": "9",
      "head_circumference": "22",
      "chest_circumference": "11",
      "dental_check_result": "問題なし",
      "exam_findings_result": "異常なし",
      "ophthalmic_findings_result": "異常なし",
      "ent_findings_result": "異常なし",
      "precision_health_check_result": "異常なし",
      "ophthalmic_findings_followup": 7,
      "ent_findings_followup": 8,
      "dental_check_decay_untreated": 11,
      "dental_check_decay_treated": 12,
      "precision_health_check_requested_date": "2022-03-03",
      "precision_health_check_date": "2022-04-04",
      "memo": "memo of $consultationKind",
    };
    */
    final selectValues = <dynamic, dynamic>{};

    //TODO 暫定的な選択値

    //TODO
    final facilityPulldownValues = ['', '大阪府', '兵庫県', '奈良県'];
    //TODO

    //----------------------//

    // base
    final consultationDateState = ref.watch(consultationDateProvider);
    final consultationYearFromBirthState =
        ref.watch(consultationYearFromBirthProvider);
    final consultationMonthFromBirthState =
        ref.watch(consultationMonthFromBirthProvider);
    final consultationHeightState = ref.watch(consultationHeightProvider);
    final consultationWeightState = ref.watch(consultationWeightProvider);
    final consultationHeadCircumferenceState =
        ref.watch(consultationHeadCircumferenceProvider);
    final consultationChestCircumferenceState =
        ref.watch(consultationChestCircumferenceProvider);

    // memo
    final consultationMemoState = ref.watch(consultationMemoProvider);

    // detail
    final consultationOphthalmicFindingsFollowupState =
        ref.watch(consultationOphthalmicFindingsFollowupProvider);
    final consultationEntFindingsFollowupState =
        ref.watch(consultationEntFindingsFollowupProvider);

    // dental
    final consultationDentalCheckDecayUntreatedState =
        ref.watch(consultationDentalCheckDecayUntreatedProvider);
    final consultationDentalCheckDecayTreatedState =
        ref.watch(consultationDentalCheckDecayTreatedProvider);

    // precision
    final consultationPrecisionHealthCheckRequestedDateState =
        ref.watch(consultationPrecisionHealthCheckRequestedDateProvider);
    final consultationPrecisionHealthCheckDateState =
        ref.watch(consultationPrecisionHealthCheckDateProvider);

    //----------------------//

    return MainLayouts(
      title: '検診入力',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
                bottom: 8,
              ),
              child: Text(
                '検診入力（${consultationTypeNames[consultationKind]}）',
                style: IHSTextStyle.medium.copyWith(
                  color: IHSColors.titleColor,
                ),
              ),
            ),
            BaseInput(
              consultationKind: consultationKind,
              selectValues: selectValues,
              facilityPulldownValues: facilityPulldownValues,
            ),

            NutritionInput(
              consultationKind: consultationKind,
              selectValues: selectValues,
            ),

            const SizedBox(height: 24),

            //表示、非表示
            if (['threeYears'].contains(consultationKind))
              Column(
                children: [
                  UrinalysisInput(
                    consultationKind: consultationKind,
                    selectValues: selectValues,
                  ),
                ],
              ),

            const SizedBox(height: 24),

            DetailInput(
              consultationKind: consultationKind,
              selectValues: selectValues,
            ),

            //表示、非表示
            if (['onehalfYears', 'threeYears'].contains(consultationKind))
              Column(
                children: [
                  const SizedBox(height: 16),
                  DentalInput(
                    consultationKind: consultationKind,
                    selectValues: selectValues,
                  ),
                ],
              ),

            //表示、非表示
            if (['onehalfYears', 'threeYears'].contains(consultationKind))
              Column(
                children: [
                  const SizedBox(height: 16),
                  PrecisionInput(
                    consultationKind: consultationKind,
                    selectValues: selectValues,
                  ),
                ],
              ),

            const SizedBox(height: 24),

            MemoInput(selectValues: selectValues),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(child: Container()),
                CancelButton(
                  buttonText: '戻る',
                  onPress: () {
                    Navigator.pushReplacementNamed(context, '/consultation');
                  },
                ),
                const SizedBox(width: 10),
                ProceedButton(
                  buttonText: '確認',
                  usage: 'consultation',
                  onPress: () {
                    consultationUserSelectValueViewModel
                      ..setValue(
                        key: 'date',
                        value: consultationDateState.text,
                      )
                      ..setValue(
                        key: 'year_from_birth',
                        value: consultationYearFromBirthState.text,
                      )
                      ..setValue(
                        key: 'month_from_birth',
                        value: consultationMonthFromBirthState.text,
                      )
                      ..setValue(
                        key: 'height',
                        value: consultationHeightState.text,
                      )
                      ..setValue(
                        key: 'weight',
                        value: consultationWeightState.text,
                      )
                      ..setValue(
                        key: 'head_circumference',
                        value: consultationHeadCircumferenceState.text,
                      )
                      ..setValue(
                        key: 'chest_circumference',
                        value: consultationChestCircumferenceState.text,
                      )
                      ..setValue(
                        key: 'memo',
                        value: consultationMemoState.text,
                      );

                    switch (consultationKind) {
                      case 'threeMonths':
                        break;

                      case 'onehalfYears':
                        consultationUserSelectValueViewModel.setValue(
                          key: 'dental_check_decay_untreated',
                          value:
                              consultationDentalCheckDecayUntreatedState.text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'dental_check_decay_treated',
                          value: consultationDentalCheckDecayTreatedState.text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'precision_health_check_requested_date',
                          value:
                              consultationPrecisionHealthCheckRequestedDateState
                                  .text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'precision_health_check_date',
                          value: consultationPrecisionHealthCheckDateState.text,
                        );

                        break;

                      case 'threeYears':
                        consultationUserSelectValueViewModel.setValue(
                          key: 'ophthalmic_findings_followup',
                          value:
                              consultationOphthalmicFindingsFollowupState.text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'ent_findings_followup',
                          value: consultationEntFindingsFollowupState.text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'dental_check_decay_untreated',
                          value:
                              consultationDentalCheckDecayUntreatedState.text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'dental_check_decay_treated',
                          value: consultationDentalCheckDecayTreatedState.text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'precision_health_check_requested_date',
                          value:
                              consultationPrecisionHealthCheckRequestedDateState
                                  .text,
                        );

                        consultationUserSelectValueViewModel.setValue(
                          key: 'precision_health_check_date',
                          value: consultationPrecisionHealthCheckDateState.text,
                        );

                        break;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConsultationConfirmScreen(
                          consultationKind: consultationKind,
                        ),
                      ),
                    );
                  },
                ),
                Expanded(child: Container()),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
