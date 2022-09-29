// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../../_components/select_panel_const_value.dart';
import '../../_components/user_select_checkbox.dart';
import '../viewmodel/consultation_user_select_value_viewmodel.dart';
import '../viewmodel/consultation_user_text_value_viewmodel.dart';

class DetailInput extends ConsumerWidget {
  DetailInput({
    Key? key,
    required this.selectValues,
    required this.consultationKind,
  }) : super(key: key);
  final Map<dynamic, dynamic> selectValues;
  final String consultationKind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consultationUserSelectValueState =
        ref.watch(consultationUserSelectValueProvider);

    final consultationUserSelectValueViewModel =
        ref.watch(consultationUserSelectValueProvider.notifier);

    final consultationOphthalmicFindingsFollowupState =
        ref.watch(consultationOphthalmicFindingsFollowupProvider);

    final consultationEntFindingsFollowupState =
        ref.watch(consultationEntFindingsFollowupProvider);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(color: Colors.white),
      child: ExpansionTile(
        title: Text(
          '詳細入力',
          style: IHSTextStyle.small,
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black54),
                    ),
                  ),
                  child: const Text('診察所見'),
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '身体的発育状況',
                  name: 'is_growth_physical',
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '精神発達',
                  name: 'is_growth_mental',
                ),

                //表示、非表示
                if (['threeMonths'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: 'けいれん',
                        name: 'is_convulsions',
                      ),
                    ],
                  ),

                //表示、非表示
                if (['onehalfYears', 'threeYears'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '熱性けいれん',
                        name: 'is_fever_convulsions',
                      ),
                    ],
                  ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '運動機能',
                  name: 'is_motor_function',
                ),

                //表示、非表示
                if (['threeMonths', 'threeYears'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '神経系・感覚器系',
                        name: 'is_nervous_sensory',
                      ),
                    ],
                  ),

                //表示、非表示
                if (['onehalfYears'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '視覚',
                        name: 'is_vision_probrem',
                      ),
                    ],
                  ),

                //表示、非表示
                if (['onehalfYears'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '聴覚',
                        name: 'is_hearing_probrem',
                      ),
                    ],
                  ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '血液系',
                  name: 'is_blood_problem',
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '皮膚',
                  name: 'is_skin_problem',
                ),

                //表示、非表示
                if (['threeMonths'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '股関節',
                        name: 'is_hip_joint',
                      ),
                    ],
                  ),

                //表示、非表示
                if (['threeMonths'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '股関節（開排制限）',
                        name: 'is_open_limit',
                      ),
                    ],
                  ),

                //表示、非表示
                if (['threeMonths'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '斜頚',
                        name: 'is_torticollis',
                      ),
                    ],
                  ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '循環器系',
                  name: 'is_circulatory_system',
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '呼吸器系',
                  name: 'is_respiratory_system',
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '消化器系',
                  name: 'is_digestive_system',
                ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '泌尿生殖器系',
                  name: 'is_genitourinary_system',
                ),

                //表示、非表示
                if (['threeMonths'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '代謝系',
                        name: 'is_metabolic_system',
                      ),
                    ],
                  ),

                const SizedBox(height: 16),

                UserSelectCheckbox(
                  selectValues: selectValues,
                  title: '先天性の身体的特徴',
                  name: 'is_congenital_physical_features',
                ),

                const SizedBox(height: 16),

                const Text('判定'),

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
                      items: SelectPanelConstValue()
                          .resultPulldownValues2
                          .map((result) {
                        return DropdownMenuItem(
                          child: Text(
                            result,
                            style: IHSTextStyle.small,
                          ),
                          value: result,
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        consultationUserSelectValueViewModel.setValue(
                          key: 'exam_findings_result',
                          value: value,
                        );
                      },
                      value: getPulldownValue(
                        selectValues: selectValues,
                        state: consultationUserSelectValueState,
                        name: 'exam_findings_result',
                      ),
                    ),
                  ),
                ),

                //表示、非表示
                if (['threeYears'].contains(consultationKind))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2, color: Colors.black54),
                          ),
                        ),
                        child: const Text('眼科所見'),
                      ),

                      const SizedBox(height: 16),

                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '両眼',
                        name: 'is_ophthalmic_both_eyes',
                      ),

                      const SizedBox(height: 16),

                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '右眼',
                        name: 'is_ophthalmic_right_eye',
                      ),

                      const SizedBox(height: 16),

                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '左眼',
                        name: 'is_ophthalmic_left_eye',
                      ),

                      const SizedBox(height: 16),

                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '眼位異常',
                        name: 'is_ophthalmic_abnormal_position',
                      ),

                      const SizedBox(height: 16),

                      const Text('判定'),

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
                            items: SelectPanelConstValue()
                                .resultPulldownValues2
                                .map((result) {
                              return DropdownMenuItem(
                                child: Text(
                                  result,
                                  style: IHSTextStyle.small,
                                ),
                                value: result,
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              consultationUserSelectValueViewModel.setValue(
                                key: 'ophthalmic_findings_result',
                                value: value,
                              );
                            },
                            value: getPulldownValue(
                              selectValues: selectValues,
                              state: consultationUserSelectValueState,
                              name: 'ophthalmic_findings_result',
                            ),
                          ),
                        ),
                      ),

                      //要経過観察期間
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text('要経過観察期間'),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: TextField(
                                    controller:
                                        consultationOphthalmicFindingsFollowupState,
                                    style: IHSTextStyle.small,
                                    decoration: const InputDecoration(
                                      fillColor: IHSColors
                                          .consultationInputBackgroundColor,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(8),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const Text('ヶ月後受診'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                //表示、非表示
                if (['threeYears'].contains(consultationKind))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 2, color: Colors.black54),
                          ),
                        ),
                        child: const Text('耳鼻咽喉科所見'),
                      ),

                      const SizedBox(height: 16),

                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '聴力右',
                        name: 'is_ent_right_ear',
                      ),

                      const SizedBox(height: 16),

                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '聴力左',
                        name: 'is_ent_left_ear',
                      ),

                      const Text('判定'),

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
                            items: SelectPanelConstValue()
                                .resultPulldownValues2
                                .map((result) {
                              return DropdownMenuItem(
                                child: Text(
                                  result,
                                  style: IHSTextStyle.small,
                                ),
                                value: result,
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              consultationUserSelectValueViewModel.setValue(
                                key: 'ent_findings_result',
                                value: value,
                              );
                            },
                            value: getPulldownValue(
                              selectValues: selectValues,
                              state: consultationUserSelectValueState,
                              name: 'ent_findings_result',
                            ),
                          ),
                        ),
                      ),

                      //要経過観察期間
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text('要経過観察期間'),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: TextField(
                                    controller:
                                        consultationEntFindingsFollowupState,
                                    style: IHSTextStyle.small,
                                    decoration: const InputDecoration(
                                      fillColor: IHSColors
                                          .consultationInputBackgroundColor,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.all(8),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const Text('ヶ月後受診'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 2, color: Colors.black54),
                    ),
                  ),
                  child: const Text('発達情報'),
                ),

                //表示、非表示
                if (['threeMonths'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '笑う',
                        name: 'is_developmental_smile',
                      ),
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '追視',
                        name: 'is_developmental_pursuit',
                      ),
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '定頸',
                        name: 'is_developmental_fixed_neck',
                      ),
                    ],
                  ),

                //表示、非表示
                if (['onehalfYears'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '人の声のする方に向く',
                        name: 'is_developmental_turn_direction',
                      ),
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: 'おもちゃをつかむ',
                        name: 'is_developmental_grab_toy',
                      ),
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: 'お座り',
                        name: 'is_developmental_sitting',
                      ),
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '発語（有意語）',
                        name: 'is_developmental_speech',
                      ),
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: 'ひとり歩き',
                        name: 'is_developmental_walking_alone',
                      ),
                    ],
                  ),

                //表示、非表示
                if (['threeYears'].contains(consultationKind))
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '二語文',
                        name: 'is_developmental_twoword_sentence',
                      ),
                    ],
                  ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
