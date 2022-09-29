// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/main_layouts.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/cancel_button.dart';
import '../_components/proceed_button.dart';
import '_components/base_input.dart';
import '_components/detail_input.dart';
import 'parent_report_confirm_screen.dart';
import 'viewmodel/parent_report_user_select_value_viewmodel.dart';
import 'viewmodel/parent_report_user_text_value_viewmodel.dart';

class ParentReportInputScreen extends ConsumerWidget {
  ParentReportInputScreen({Key? key, required this.parentReportKind})
      : super(key: key);
  final String parentReportKind;

  Map<String, dynamic> commonValueMap = {};
  Map<String, String> parentReportValueMap = {};
  Map<String, dynamic> typeValueMap = {};

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentReportUserSelectValueState =
        ref.watch(parentReportUserSelectValueProvider);

    final parentReportUserSelectValueViewModel =
        ref.watch(parentReportUserSelectValueProvider.notifier);

    /*
    var selectValues = {
      "is_hand_leg_move": 1,
      "is_milk_drink": 1,
      "is_noise_surprised": 1,
      "is_navel_dry": 1,
      "is_frank_adviser": 1,
      "is_anxiety_child_rearing": 2,

      //

      "is_eye_move_abnormal": 0,
      "is_turn_to_call": 1,
      "is_outside_air_bath": 1,

      //

      "is_grab_toy": 1,
      "is_speaking_with_family": 1,
      "is_turn_to_sound": 1,
      "is_nutrition_weaning": 1,
      "is_pupil_white": 0,

      //

      "is_pinch_small": 1,
      "is_playing_alone": 1,
      "is_nutrition_weaning_smooth": 1,
      "is_turn_to_whisper": 1,
      "is_chasing_after": 1,
      "is_oral_env_abnormal": 0,

      //

      "is_hello_gesture": 1,
      "is_swing_with_music": 1,
//      "is_nutrition_weaning_smooth": 1,
      "is_understand_easy_word": 1,
      "is_turn_to_point_finger": 1,
      "is_happy_play_together": 1,
      "is_rhythm_of_meal": 1,
      "is_dentifrice_practice": 1,

      //

      "is_mean_word_speak": 1,
      "is_drinking_use_cup": 1,
      "is_use_baby_bottle": 0,
      "is_meal_time_fixed": 1,
      "is_teeth_finish_polish": 1,
      "is_dazzling": 0,
      "is_turn_to_call_from_back": 1,
      "is_use_fluorine_tooth_paste": 0,

      //

      "is_running": 1,
      "is_eating_use_spoon": 1,
      "is_liken_use_block": 1,
      "is_gesture_imitate": 1,
      "is_speak_twoword_sentence": 1,
      "is_eat_meat_fiber_vegetables": 1,
//      "is_teeth_finish_polish": 1,

      //

      "is_climb_stairs_alone": 1,
      "is_circle_drawing": 1,
      "is_wear_clothes_alone": 1,
      "is_speak_name": 1,
      "is_dentifrice_handwash": 1,
//      "is_teeth_finish_polish": 1,
      "is_thumb_sucking": 1,
      "is_chew_eat_habit": 1,
      "is_squint": 0,
      "is_narrow_eyes": 0,
      "is_deaf_suspicion": 0,
      "is_teeth_alignment": 0,
//      "is_use_fluorine_tooth_paste": 0,
      "is_playing_house_playing_hero": 1,
      "is_have_playing_friends": 1,

      //

      "date": "2022-01-01",

      "memo": "memo of $parentReportKind",

      "favorite_play": "favorite play of $parentReportKind",

      "neck_fixed_date": "2021-02-02",

      "tossing_and_turning_date": "2021-03-03",
      "sitting_alone_date": "2021-03-04",

      "crawl_date": "2021-04-04",
      "standup_date": "2021-04-05",

      "cramped_walk_date": "2021-05-01",

      "walking_alone_date": "2021-06-01",

      "birthday_message": "birthday message of $parentReportKind",
    };
*/

    final selectValues = <dynamic, dynamic>{};

    final parentReportDateState = ref.watch(parentReportDateProvider);
    final parentReportNeckFixedDateState =
        ref.watch(parentReportNeckFixedDateProvider);
    final parentReportTossingAndTurningDateState =
        ref.watch(parentReportTossingAndTurningDateProvider);
    final parentReportSittingAloneDateState =
        ref.watch(parentReportSittingAloneDateProvider);
    final parentReportCrawlDateState = ref.watch(parentReportCrawlDateProvider);
    final parentReportStandupDateState =
        ref.watch(parentReportStandupDateProvider);
    final parentReportCrampedWalkDateState =
        ref.watch(parentReportCrampedWalkDateProvider);
    final parentReportWalkingAloneDateState =
        ref.watch(parentReportWalkingAloneDateProvider);
    final parentReportFavoritePlayState =
        ref.watch(parentReportFavoritePlayProvider);
    final parentReportBirthdayMessageState =
        ref.watch(parentReportBirthdayMessageProvider);
    final parentReportMemoState = ref.watch(parentReportMemoProvider);
    final parentReportTeethingDateState =
        ref.watch(parentReportTeethingDateProvider);

    return MainLayouts(
      title: '保護者の記録',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
                bottom: 8,
              ),
              child: Text(
                '保護者の記録',
                style: IHSTextStyle.medium.copyWith(
                  color: IHSColors.titleColor,
                ),
              ),
            ),
            BaseInput(
              parentReportKind: parentReportKind,
              selectValues: selectValues,
            ),
            const SizedBox(height: 24),
            DetailInput(
              parentReportKind: parentReportKind,
              selectValues: selectValues,
            ),
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
                    parentReportUserSelectValueViewModel
                      ..setValue(
                        key: 'report_date',
                        value: parentReportDateState.text,
                      )
                      ..setValue(
                        key: 'memo',
                        value: parentReportMemoState.text,
                      );

                    final positions = [
                      'teethTR1',
                      'teethTR2',
                      'teethTR3',
                      'teethTR4',
                      'teethTR5',
                      'teethTL1',
                      'teethTL2',
                      'teethTL3',
                      'teethTL4',
                      'teethTL5',
                      'teethBR1',
                      'teethBR2',
                      'teethBR3',
                      'teethBR4',
                      'teethBR5',
                      'teethBL1',
                      'teethBL2',
                      'teethBL3',
                      'teethBL4',
                      'teethBL5',
                    ];

                    final decayPosition = <String>[];

                    switch (parentReportKind) {
                      case 'oneMonths':
                        break;
                      case 'threeMonths':
                        parentReportUserSelectValueViewModel.setValue(
                          key: 'neck_fixed_date',
                          value: parentReportNeckFixedDateState.text,
                        );

                        break;
                      case 'sixMonths':
                        parentReportUserSelectValueViewModel.setValue(
                          key: 'tossing_and_turning_date',
                          value: parentReportTossingAndTurningDateState.text,
                        );

                        parentReportUserSelectValueViewModel.setValue(
                          key: 'sitting_alone_date',
                          value: parentReportSittingAloneDateState.text,
                        );

                        break;
                      case 'nineMonths':
                        parentReportUserSelectValueViewModel.setValue(
                          key: 'crawl_date',
                          value: parentReportCrawlDateState.text,
                        );

                        parentReportUserSelectValueViewModel.setValue(
                          key: 'standup_date',
                          value: parentReportStandupDateState.text,
                        );

                        parentReportUserSelectValueViewModel.setValue(
                          key: 'teething_date',
                          value: parentReportTeethingDateState.text,
                        );

                        for (var i = 0; i < positions.length; i++) {
                          if (parentReportUserSelectValueState[positions[i]] ==
                              1) {
                            decayPosition.add(positions[i]);
                          }
                        }

                        parentReportUserSelectValueViewModel.setValue(
                          key: 'decay_position',
                          value: decayPosition.join(', '),
                        );

                        break;
                      case 'oneYears':
                        parentReportUserSelectValueViewModel.setValue(
                          key: 'cramped_walk_date',
                          value: parentReportCrampedWalkDateState.text,
                        );

                        parentReportUserSelectValueViewModel.setValue(
                          key: 'favorite_play',
                          value: parentReportFavoritePlayState.text,
                        );

                        for (var i = 0; i < positions.length; i++) {
                          if (parentReportUserSelectValueState[positions[i]] ==
                              1) {
                            decayPosition.add(positions[i]);
                          }
                        }

                        parentReportUserSelectValueViewModel.setValue(
                          key: 'decay_position',
                          value: decayPosition.join(', '),
                        );

                        break;
                      case 'onehalfYears':
                        parentReportUserSelectValueViewModel.setValue(
                          key: 'walking_alone_date',
                          value: parentReportWalkingAloneDateState.text,
                        );

                        parentReportUserSelectValueViewModel.setValue(
                          key: 'favorite_play',
                          value: parentReportFavoritePlayState.text,
                        );

                        break;
                      case 'twoYears':
                        parentReportUserSelectValueViewModel.setValue(
                          key: 'favorite_play',
                          value: parentReportFavoritePlayState.text,
                        );

                        break;
                      case 'threeYears':
                        parentReportUserSelectValueViewModel.setValue(
                          key: 'birthday_message',
                          value: parentReportBirthdayMessageState.text,
                        );

                        break;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ParentReportConfirmScreen(
                          parentReportKind: parentReportKind,
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
