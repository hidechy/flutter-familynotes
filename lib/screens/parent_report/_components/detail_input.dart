// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../function.dart';
import '../../../style/colors.dart';
import '../../../style/text_style.dart';
import '../../_components/select_panel_anxiety_child_rearing.dart';
import '../../_components/select_panel_const_value.dart';
import '../../_components/select_panel_half_row.dart';
import '../../_components/user_select_checkbox.dart';
import '../viewmodel/parent_report_user_select_value_viewmodel.dart';
import '../viewmodel/parent_report_user_text_value_viewmodel.dart';
import 'dental_input.dart';
import 'memo_input.dart';

class DetailInput extends ConsumerWidget {
  DetailInput(
      {Key? key, required this.parentReportKind, required this.selectValues})
      : super(key: key);
  final String parentReportKind;
  final Map<dynamic, dynamic> selectValues;

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final parentReportUserSelectValueState =
        ref.watch(parentReportUserSelectValueProvider);

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

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      width: double.infinity,
      child: DefaultTextStyle(
        style: IHSTextStyle.small,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //表示、非表示
            if (['oneMonths'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '裸にすると手足をよく動かしますか。',
                    name: 'is_hand_leg_move',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'お乳をよく飲みますか。',
                    name: 'is_milk_drink',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '大きな音にビクッと手足を伸ばしたり、泣き出すことがありますか。',
                    name: 'is_noise_surprised',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'おへそは乾いていますか。\n（ジクジクしている時は医師に見てもらいましょう。）',
                    name: 'is_navel_dry',
                  ),
                  getBorder(),
                ],
              ),

            //表示、非表示
            if (['threeMonths'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '首がすわったのはいつですか。\n（「首がすわる」とは、支えなしで首がぐらつかない状態をいいます。）',
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: GestureDetector(
                      onTap: getNeckFixedDate,
                      child: TextField(
                        enabled: false,
                        controller: parentReportNeckFixedDateState,
                        style: IHSTextStyle.small,
                        decoration: const InputDecoration(
                          fillColor: IHSColors.consultationInputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'あやすとよく笑いますか。',
                    name: 'is_cradle_smile',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '目つきや目の動きがおかしいのではないかと気になりますか。',
                    name: 'is_eye_move_abnormal',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '見えない方向から声をかけてみると、そちらを見ようとしますか。',
                    name: 'is_turn_to_call',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '外気浴をしていますか。\n（天気のよい日に薄着で散歩するなど）',
                    name: 'is_outside_air_bath',
                  ),
                  getBorder(),
                ],
              ),

            //表示、非表示
            if (['sixMonths'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('寝返りをしたのはいつですか。'),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: GestureDetector(
                      onTap: getTossingAndTurningDate,
                      child: TextField(
                        enabled: false,
                        controller: parentReportTossingAndTurningDateState,
                        style: IHSTextStyle.small,
                        decoration: const InputDecoration(
                          fillColor: IHSColors.consultationInputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  getBorder(),
                  const Text(
                    'ひとりすわりをしたのはいつですか。\n（「ひとりすわり」とは、支えなくてもすわれることをいいます。）',
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: GestureDetector(
                      onTap: getSittingAloneDate,
                      child: TextField(
                        enabled: false,
                        controller: parentReportSittingAloneDateState,
                        style: IHSTextStyle.small,
                        decoration: const InputDecoration(
                          fillColor: IHSColors.consultationInputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'からだのそばにあるおもちゃに手を伸ばしてつかみますか。',
                    name: 'is_grab_toy',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '家族といっしょにいるとき、話しかけるような声を出しますか。',
                    name: 'is_speaking_with_family',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'テレビやラジオの音がしはじめると、すぐにそちらを見ますか。',
                    name: 'is_turn_to_sound',
                  ),
                  getBorder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '離乳食を始めましたか。',
                        name: 'is_nutrition_weaning',
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                  getBorder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: 'ひとみが白く見えたり、黄緑色に光って見えたりすることがありますか。',
                        name: 'is_pupil_white',
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                  getBorder(),
                ],
              ),

            //表示、非表示
            if (['nineMonths'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('はいはいをしたのはいつですか。'),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: GestureDetector(
                      onTap: getCrawlDate,
                      child: TextField(
                        enabled: false,
                        controller: parentReportCrawlDateState,
                        style: IHSTextStyle.small,
                        decoration: const InputDecoration(
                          fillColor: IHSColors.consultationInputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  getBorder(),
                  const Text('つかまり立ちをしたのはいつですか。'),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: GestureDetector(
                      onTap: getStandupDate,
                      child: TextField(
                        enabled: false,
                        controller: parentReportStandupDateState,
                        style: IHSTextStyle.small,
                        decoration: const InputDecoration(
                          fillColor: IHSColors.consultationInputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '指で小さいものをつまみますか。\n（たばこや豆などの異物誤飲に注意しましょう。）',
                    name: 'is_pinch_small',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '機嫌よくひとりあそびができますか。',
                    name: 'is_playing_alone',
                  ),
                  getBorder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '離乳は順調に進んでいますか。',
                        name: 'is_nutrition_weaning_smooth',
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'そっと近づいて、ささやき声で呼びかけると振り向きますか。',
                    name: 'is_turn_to_whisper',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '後追いしますか。',
                    name: 'is_chasing_after',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯の生え方、形、色、歯肉などについて、気になることがありますか。',
                    name: 'is_oral_env_abnormal',
                  ),
                  getBorder(),
                ],
              ),

            //表示、非表示
            if (['oneYears'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('つたい歩きをしたのはいつですか。'),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: GestureDetector(
                      onTap: getCrampedWalkDate,
                      child: TextField(
                        enabled: false,
                        controller: parentReportCrampedWalkDateState,
                        style: IHSTextStyle.small,
                        decoration: const InputDecoration(
                          fillColor: IHSColors.consultationInputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'バイバイ、コンニチワなどの身振りをしますか。',
                    name: 'is_hello_gesture',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '音楽に合わせて、からだを楽しそうに動かしますか。',
                    name: 'is_swing_with_music',
                  ),
                  getBorder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '離乳は順調にすすんでいますか。',
                        name: 'is_nutrition_weaning_smooth',
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '大人の言う簡単な言葉（おいで、ちょうだいなど）がわかりますか。',
                    name: 'is_understand_easy_word',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '部屋の離れたところにあるおもちゃを指さすと、その方向を見ますか。',
                    name: 'is_turn_to_point_finger',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '一緒に遊ぶと喜びますか。',
                    name: 'is_happy_play_together',
                  ),
                  getBorder(),
                  const Text('どんな遊びが好きですか。'),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: parentReportFavoritePlayState,
                      maxLines: 5,
                      style: IHSTextStyle.small,
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                  getBorder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '1日3回の食事のリズムがつきましたか。',
                        name: 'is_rhythm_of_meal',
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯みがきの練習をはじめていますか。',
                    name: 'is_dentifrice_practice',
                  ),
                  getBorder(),
                ],
              ),

            //表示、非表示
            if (['onehalfYears'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ひとり歩きをしたのはいつですか。'),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                    ),
                    child: GestureDetector(
                      onTap: getWalkingAloneDate,
                      child: TextField(
                        enabled: false,
                        controller: parentReportWalkingAloneDateState,
                        style: IHSTextStyle.small,
                        decoration: const InputDecoration(
                          fillColor: IHSColors.consultationInputBackgroundColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                    ),
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'ママ、ブーブーなど意味のある言葉をいくつか話しますか。',
                    name: 'is_mean_word_speak',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '自分でコップを持って水を飲めますか。',
                    name: 'is_drinking_use_cup',
                  ),
                  getBorder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '哺乳ビンを使っていますか。',
                        name: 'is_use_baby_bottle',
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '食事や間食（おやつ）の時間はだいたい決まっていますか。',
                    name: 'is_meal_time_fixed',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯の仕上げみがきをしてあげていますか。',
                    name: 'is_teeth_finish_polish',
                  ),
                  getBorder(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserSelectCheckbox(
                        selectValues: selectValues,
                        title: '極端に眩しがったり、目の動きがおかしいのではないかと気になったりしますか。',
                        name: 'is_dazzling',
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.info_outline),
                        ),
                      ),
                    ],
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'うしろから名前を呼んだとき、振り向きますか。',
                    name: 'is_turn_to_call_from_back',
                  ),
                  getBorder(),
                  const Text('どんな遊びが好きですか。'),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: parentReportFavoritePlayState,
                      maxLines: 5,
                      style: IHSTextStyle.small,
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯にフッ化物（フッ素）の塗布やフッ素入り歯磨きの使用をしていますか。',
                    name: 'is_use_fluorine_tooth_paste',
                  ),
                  getBorder(),
                ],
              ),

            //表示、非表示
            if (['twoYears'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '走ることができますか。',
                    name: 'is_running',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'スプーンを使って自分で食べますか。',
                    name: 'is_eating_use_spoon',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '積木で塔のようなものを作ったり、横に並べて電車などにみたてたりして遊ぶことをしますか。',
                    name: 'is_liken_use_block',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'テレビや大人の身振りのまねをしますか。',
                    name: 'is_gesture_imitate',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '2語文（ワンワンキタ、マンマチョウダイ）などを言いますか。',
                    name: 'is_speak_twoword_sentence',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '肉や繊維のある野菜を食べますか。',
                    name: 'is_eat_meat_fiber_vegetables',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯の仕上げみがきをしてあげていますか。',
                    name: 'is_teeth_finish_polish',
                  ),
                  getBorder(),
                  const Text('どんな遊びが好きですか。'),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: parentReportFavoritePlayState,
                      maxLines: 5,
                      style: IHSTextStyle.small,
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                  getBorder(),
                ],
              ),

            //表示、非表示
            if (['threeYears'].contains(parentReportKind))
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('3歳の誕生日メッセージを記入しましょう。'),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      controller: parentReportBirthdayMessageState,
                      maxLines: 5,
                      style: IHSTextStyle.small,
                      decoration: const InputDecoration(
                        fillColor: IHSColors.consultationInputBackgroundColor,
                        filled: true,
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '手を使わずにひとりで階段をのぼれますか。',
                    name: 'is_climb_stairs_alone',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'クレヨンなどで丸（円）を書きますか。',
                    name: 'is_circle_drawing',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '衣服の着脱をひとりでしたがりますか。',
                    name: 'is_wear_clothes_alone',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '自分の名前が言えますか。',
                    name: 'is_speak_name',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯磨きや手洗いをしていますか。',
                    name: 'is_dentifrice_handwash',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯の仕上げみがきをしてあげていますか。',
                    name: 'is_teeth_finish_polish',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'いつも指しゃぶりをしていますか。',
                    name: 'is_thumb_sucking',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'よくかんで食べる習慣はありますか。',
                    name: 'is_chew_eat_habit',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '斜視はありますか。',
                    name: 'is_squint',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '物を見るとき目を細めたり、極端に近づけて見たりしますか。',
                    name: 'is_narrow_eyes',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '耳の聞こえが悪いのではないかと気になりますか。',
                    name: 'is_deaf_suspicion',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'かみ合わせや歯並びで気になることがありますか。',
                    name: 'is_teeth_alignment',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '歯にフッ化物（フッ素）の塗布やフッ素入り歯磨きの使用をしていますか。',
                    name: 'is_use_fluorine_tooth_paste',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: 'ままごと、ヒーローごっこなど、ごっこ遊びができますか。',
                    name: 'is_playing_house_playing_hero',
                  ),
                  getBorder(),
                  UserSelectCheckbox(
                    selectValues: selectValues,
                    title: '遊び友達がいますか。',
                    name: 'is_have_playing_friends',
                  ),
                  getBorder(),
                ],
              ),

            const Text('子育てについて気軽に相談できる人はいますか。'),

            const SizedBox(height: 8),

            SelectPanelHalfRow(
              title: '',
              name: 'is_frank_adviser',
              value: getValue(
                selectValues: selectValues,
                state: parentReportUserSelectValueState,
                name: 'is_frank_adviser',
                minus: 0,
              ),
            ),

            getBorder(),

            const Text('子育てについて不安や困難を感じることはありますか。'),

            const SizedBox(height: 8),

            SelectPanelAnxietyChildRearing(
              valueList: SelectPanelConstValue().anxietyChildRearingValueList,
              value: getValue(
                selectValues: selectValues,
                state: parentReportUserSelectValueState,
                name: 'is_anxiety_child_rearing',
                minus: 1,
              ),
              selectName: 'is_anxiety_child_rearing',
            ),

            getBorder(),

            const Text('成長の様子、育児の心配、かかった病気、感想などを自由に記入しましょう。'),

            MemoInput(selectValues: selectValues),

            //表示、非表示
            if (['nineMonths', 'oneYears'].contains(parentReportKind))
              Column(
                children: [
                  const SizedBox(height: 24),
                  DentalInput(
                    parentReportKind: parentReportKind,
                    selectValues: selectValues,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget getBorder() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(color: IHSColors.borderColor, thickness: 2),
        SizedBox(height: 8),
      ],
    );
  }

  Future<void> getNeckFixedDate() async {
    final parentReportNeckFixedDateState =
        _ref.watch(parentReportNeckFixedDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportNeckFixedDateState.text = val;
    });
  }

  Future<void> getTossingAndTurningDate() async {
    final parentReportTossingAndTurningDateState =
        _ref.watch(parentReportTossingAndTurningDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportTossingAndTurningDateState.text = val;
    });
  }

  Future<void> getSittingAloneDate() async {
    final parentReportSittingAloneDateState =
        _ref.watch(parentReportSittingAloneDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportSittingAloneDateState.text = val;
    });
  }

  Future<void> getCrawlDate() async {
    final parentReportCrawlDateState =
        _ref.watch(parentReportCrawlDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportCrawlDateState.text = val;
    });
  }

  Future<void> getStandupDate() async {
    final parentReportStandupDateState =
        _ref.watch(parentReportStandupDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportStandupDateState.text = val;
    });
  }

  Future<void> getCrampedWalkDate() async {
    final parentReportCrampedWalkDateState =
        _ref.watch(parentReportCrampedWalkDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportCrampedWalkDateState.text = val;
    });
  }

  Future<void> getWalkingAloneDate() async {
    final parentReportWalkingAloneDateState =
        _ref.watch(parentReportWalkingAloneDateProvider);

    final pickedDate = getPickedDate(context: _context);

    await pickedDate.then((val) {
      parentReportWalkingAloneDateState.text = val;
    });
  }
}
