// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/main_layouts.dart';
import '../../style/text_style.dart';
import '../_components/select_panel_const_value.dart';
import 'viewmodel/consultation_user_select_value_viewmodel.dart';

class ConsultationConfirmScreen extends ConsumerWidget {
  ConsultationConfirmScreen({Key? key, required this.consultationKind})
      : super(key: key);
  final String consultationKind;

  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    var confirmItemList = <Map<String, String>>[];

    switch (consultationKind) {
      case 'threeMonths':
        confirmItemList = [
          {'key': 'date', 'value': '検診日'},
          {'key': 'year_from_birth', 'value': '生後（年）'},
          {'key': 'month_from_birth', 'value': '生後（月）'},
          {'key': 'height', 'value': '身長（ｃｍ）'},
          {'key': 'weight', 'value': '体重（ｇ）'},
          {'key': 'head_circumference', 'value': '頭囲（ｃｍ）'},
          {'key': 'chest_circumference', 'value': '胸囲（ｃｍ）'},
          {'key': 'nutrition_method', 'value': '栄養'},
          {'key': 'nutrition_check', 'value': '栄養評価'},
          {'key': 'is_growth_physical', 'value': '診察所見－身体的発育状況'},
          {'key': 'is_growth_mental', 'value': '診察所見－精神発達'},
          {'key': 'is_convulsions', 'value': '診察所見－けいれん'},
          {'key': 'is_motor_function', 'value': '診察所見－運動機能'},
          {'key': 'is_nervous_sensory', 'value': '診察所見－神経系・感覚器系'},
          {'key': 'is_blood_problem', 'value': '診察所見－血液系'},
          {'key': 'is_skin_problem', 'value': '診察所見－皮膚'},
          {'key': 'is_hip_joint', 'value': '診察所見－股関節'},
          {'key': 'is_open_limit', 'value': '診察所見－股関節（開排制限）'},
          {'key': 'is_torticollis', 'value': '診察所見－斜頚'},
          {'key': 'is_circulatory_system', 'value': '診察所見－循環器系'},
          {'key': 'is_respiratory_system', 'value': '診察所見－呼吸器系'},
          {'key': 'is_digestive_system', 'value': '診察所見－消化器系'},
          {'key': 'is_genitourinary_system', 'value': '診察所見－泌尿生殖器系'},
          {'key': 'is_metabolic_system', 'value': '診察所見－代謝系'},
          {'key': 'is_congenital_physical_features', 'value': '診察所見－先天性の身体的特徴'},
          {'key': 'exam_findings_result', 'value': '診察所見－判定'},
          {'key': 'is_developmental_smile', 'value': '発達情報－笑う'},
          {'key': 'is_developmental_pursuit', 'value': '発達情報－追視'},
          {'key': 'is_developmental_fixed_neck', 'value': '発達情報－定頸'},
          {'key': 'memo', 'value': 'メモ'},
        ];

        break;
      case 'onehalfYears':
        confirmItemList = [
          {'key': 'date', 'value': '検診日'},
          {'key': 'year_from_birth', 'value': '生後（年）'},
          {'key': 'month_from_birth', 'value': '生後（月）'},
          {'key': 'height', 'value': '身長（ｃｍ）'},
          {'key': 'weight', 'value': '体重（ｋｇ）'},
          {'key': 'head_circumference', 'value': '頭囲（ｃｍ）'},
          {'key': 'chest_circumference', 'value': '胸囲（ｃｍ）'},
          {'key': 'nutrition_milk', 'value': '栄養・母乳及び人工乳'},
          {'key': 'nutrition_weaning', 'value': '栄養・離乳食'},
          {'key': 'nutrition_check', 'value': '栄養評価'},
          {'key': 'is_growth_physical', 'value': '診察所見－身体的発育状況'},
          {'key': 'is_growth_mental', 'value': '診察所見－精神発達'},
          {'key': 'is_fever_convulsions', 'value': '診察所見－熱性けいれん'},
          {'key': 'is_motor_function', 'value': '診察所見－運動機能'},
          {'key': 'is_vision_probrem', 'value': '診察所見－視覚'},
          {'key': 'is_hearing_probrem', 'value': '診察所見－聴覚'},
          {'key': 'is_blood_problem', 'value': '診察所見－血液系'},
          {'key': 'is_skin_problem', 'value': '診察所見－皮膚'},
          {'key': 'is_circulatory_system', 'value': '診察所見－循環器系'},
          {'key': 'is_respiratory_system', 'value': '診察所見－呼吸器系'},
          {'key': 'is_digestive_system', 'value': '診察所見－消化器系'},
          {'key': 'is_genitourinary_system', 'value': '診察所見－泌尿生殖器系'},
          {'key': 'is_congenital_physical_features', 'value': '診察所見－先天性の身体的特徴'},
          {'key': 'exam_findings_result', 'value': '診察所見－判定'},
          {
            'key': 'is_developmental_turn_direction',
            'value': '発達情報－人の声のする方に向く'
          },
          {'key': 'is_developmental_grab_toy', 'value': '発達情報－おもちゃをつかむ'},
          {'key': 'is_developmental_sitting', 'value': '発達情報－お座り'},
          {'key': 'is_developmental_speech', 'value': '発達情報－発語（有意語）'},
          {'key': 'is_developmental_walking_alone', 'value': '発達情報－ひとり歩き'},
          {'key': 'dental_check_decay', 'value': '歯科所見－むし歯の状態'},
          {'key': 'dental_check_decay_untreated', 'value': '歯科所見－未処置のむし歯の本数'},
          {'key': 'dental_check_decay_treated', 'value': '歯科所見－処置済みのむし歯の本数'},
          {'key': 'is_dental_gingiva', 'value': '歯科所見－歯肉・粘膜'},
          {'key': 'is_dental_engagement', 'value': '歯科所見－かみ合わせ'},
          {'key': 'dental_check_result', 'value': '歯科所見－判定'},
          {
            'key': 'precision_health_check_requested_date',
            'value': '精密健康診査依頼日'
          },
          {'key': 'precision_health_check_date', 'value': '精密健康診査受診日'},
          {'key': 'precision_health_check_result', 'value': '所見又は今後の処置'},
          {'key': 'memo', 'value': 'メモ'},
        ];

        break;
      case 'threeYears':
        confirmItemList = [
          {'key': 'date', 'value': '検診日'},
          {'key': 'year_from_birth', 'value': '生後（年）'},
          {'key': 'month_from_birth', 'value': '生後（月）'},
          {'key': 'height', 'value': '身長（ｃｍ）'},
          {'key': 'weight', 'value': '体重（ｋｇ）'},
          {'key': 'head_circumference', 'value': '頭囲（ｃｍ）'},
          {'key': 'chest_circumference', 'value': '胸囲（ｃｍ）'},
          {'key': 'nutrition_check', 'value': '栄養評価'},
          {'key': 'urinalysis_protein', 'value': '尿蛋白'},
          {'key': 'urinalysis_sugar', 'value': '尿糖'},
          {'key': 'urinalysis_occult_blood', 'value': '尿潜血'},
          {'key': 'is_growth_physical', 'value': '診察所見－身体的発育状況'},
          {'key': 'is_growth_mental', 'value': '診察所見－精神発達'},
          {'key': 'is_fever_convulsions', 'value': '診察所見－熱性けいれん'},
          {'key': 'is_motor_function', 'value': '診察所見－運動機能'},
          {'key': 'is_nervous_sensory', 'value': '診察所見－神経系・感覚器系'},
          {'key': 'is_blood_problem', 'value': '診察所見－血液系'},
          {'key': 'is_skin_problem', 'value': '診察所見－皮膚'},
          {'key': 'is_circulatory_system', 'value': '診察所見－循環器系'},
          {'key': 'is_respiratory_system', 'value': '診察所見－呼吸器系'},
          {'key': 'is_digestive_system', 'value': '診察所見－消化器系'},
          {'key': 'is_genitourinary_system', 'value': '診察所見－泌尿生殖器系'},
          {'key': 'is_congenital_physical_features', 'value': '診察所見－先天性の身体的特徴'},
          {'key': 'exam_findings_result', 'value': '診察所見－判定'},
          {'key': 'is_ophthalmic_both_eyes', 'value': '眼科所見－両眼'},
          {'key': 'is_ophthalmic_right_eye', 'value': '眼科所見－右眼'},
          {'key': 'is_ophthalmic_left_eye', 'value': '眼科所見－左眼'},
          {'key': 'is_ophthalmic_abnormal_position', 'value': '眼科所見－眼位異常'},
          {'key': 'ophthalmic_findings_result', 'value': '眼科所見－判定'},
          {'key': 'ophthalmic_findings_followup', 'value': '眼科所見－要経過観察（か月後）'},
          {'key': 'is_ent_right_ear', 'value': '耳鼻咽喉科所見－聴力右'},
          {'key': 'is_ent_left_ear', 'value': '耳鼻咽喉科所見－聴力左'},
          {'key': 'ent_findings_result', 'value': '耳鼻咽喉科所見－判定'},
          {'key': 'ent_findings_followup', 'value': '耳鼻咽喉科所見－要経過観察（か月後）'},
          {'key': 'is_developmental_twoword_sentence', 'value': '発達情報－二語文'},
          {'key': 'dental_check_decay', 'value': '歯科所見－むし歯の状態'},
          {'key': 'dental_check_decay_untreated', 'value': '歯科所見－未処置のむし歯の本数'},
          {'key': 'dental_check_decay_treated', 'value': '歯科所見－処置済のむし歯の本数'},
          {'key': 'is_dental_gingiva', 'value': '歯科所見－歯肉・粘膜'},
          {'key': 'is_dental_engagement', 'value': '歯科所見－かみ合わせ'},
          {'key': 'dental_check_result', 'value': '歯科所見－判定'},
          {
            'key': 'precision_health_check_requested_date',
            'value': '精密健康診査依頼日'
          },
          {'key': 'precision_health_check_date', 'value': '精密健康診査受診日'},
          {'key': 'precision_health_check_result', 'value': '所見又は今後の処置'},
          {'key': 'memo', 'value': 'メモ'},
        ];

        break;
    }

    final list = <Widget>[];
    for (var i = 0; i < confirmItemList.length; i++) {
      list.add(
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 2)),
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(confirmItemList[i]['value']!)),
              const SizedBox(width: 20),
              Expanded(
                child: Text(getDisplayValue(key: confirmItemList[i]['key']!)),
              ),
            ],
          ),
        ),
      );
    }

    return MainLayouts(
      title: '検診入力（確認）',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              consultationKind,
              style: IHSTextStyle.large,
            ),
            const Divider(color: Colors.black, thickness: 1),
            Column(
              children: list,
            ),
          ],
        ),
      ),
    );
  }

  String getDisplayValue({required String key}) {
    final consultationUserSelectValueState =
        _ref.watch(consultationUserSelectValueProvider);

    var ret = '';

    switch (key) {
      case 'exam_findings_result':
      case 'ophthalmic_findings_result':
      case 'ent_findings_result':
        for (var i = 0;
            i < SelectPanelConstValue().resultPulldownValues2.length;
            i++) {
          if (consultationUserSelectValueState[key] ==
              SelectPanelConstValue().resultPulldownValues2[i]) {
            ret = i.toString();
          }
        }

        break;

      case 'precision_health_check_result':
        for (var i = 0;
            i < SelectPanelConstValue().resultPulldownValues3.length;
            i++) {
          if (consultationUserSelectValueState[key] ==
              SelectPanelConstValue().resultPulldownValues3[i]) {
            ret = i.toString();
          }
        }

        break;

      case 'dental_check_result':
        for (var i = 0;
            i < SelectPanelConstValue().resultPulldownValues4.length;
            i++) {
          if (consultationUserSelectValueState[key] ==
              SelectPanelConstValue().resultPulldownValues4[i]) {
            ret = i.toString();
          }
        }

        break;

      default:
        ret = consultationUserSelectValueState[key].toString();
        break;
    }

    return ret;
  }
}
