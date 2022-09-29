import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../layouts/main_layouts.dart';
import '../../style/text_style.dart';
import 'viewmodel/parent_report_user_select_value_viewmodel.dart';

class ParentReportConfirmScreen extends ConsumerWidget {
  const ParentReportConfirmScreen({Key? key, required this.parentReportKind})
      : super(key: key);
  final String parentReportKind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentReportUserSelectValueState =
        ref.watch(parentReportUserSelectValueProvider);

    var confirmItemList = <Map<String, String>>[];

    switch (parentReportKind) {
      case 'oneMonths':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'is_hand_leg_move', 'value': '裸にすると手足をよく動かしますか'},
          {'key': 'is_milk_drink', 'value': 'お乳をよく飲みますか'},
          {
            'key': 'is_noise_surprised',
            'value': '大きな音にビクッと手足を伸ばしたり、泣き出すことがありますか'
          },
          {'key': 'is_navel_dry', 'value': 'おへそは乾いていますか'},
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;

      case 'threeMonths':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'neck_fixed_date', 'value': '首がすわったのはいつですか'},
          {'key': 'is_cradle_smile', 'value': 'あやすとよく笑いますか'},
          {
            'key': 'is_eye_move_abnormal',
            'value': '目つきや目の動きがおかしいのではないかと気になりますか'
          },
          {'key': 'is_turn_to_call', 'value': '見えない方向から声をかけてみると、そちらを見ようとしますか'},
          {'key': 'is_outside_air_bath', 'value': '外気浴をしていますか'},
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;

      case 'sixMonths':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'tossing_and_turning_date', 'value': '寝返りをしたのはいつですか'},
          {'key': 'sitting_alone_date', 'value': 'ひとりすわりをしたのはいつですか'},
          {'key': 'is_grab_toy', 'value': 'からだのそばにあるおもちゃに手を伸ばしてつかみますか'},
          {
            'key': 'is_speaking_with_family',
            'value': '家族といっしょにいるとき、話しかけるような声を出しますか'
          },
          {'key': 'is_turn_to_sound', 'value': 'テレビやラジオの音がしはじめると、すぐにそちらを見ますか'},
          {'key': 'is_nutrition_weaning', 'value': '離乳食を始めましたか'},
          {
            'key': 'is_pupil_white',
            'value': 'ひとみが白く見えたり、黄緑色に光って見えたりすることがありますか'
          },
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;

      case 'nineMonths':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'crawl_date', 'value': 'はいはいをしたのはいつですか'},
          {'key': 'standup_date', 'value': 'つかまり立ちをしたのはいつですか'},
          {'key': 'is_pinch_small', 'value': '指で小さいものをつまみますか'},
          {'key': 'is_playing_alone', 'value': '機嫌よくひとりあそびができますか'},
          {'key': 'is_nutrition_weaning_smooth', 'value': '離乳は順調に進んでいますか'},
          {'key': 'is_turn_to_whisper', 'value': 'そっと近づいて、ささやき声で呼びかけると振り向きますか'},
          {'key': 'is_chasing_after', 'value': '後追いしますか'},
          {
            'key': 'is_oral_env_abnormal',
            'value': '歯の生え方、形、色、歯肉などについて、気になることがありますか'
          },
          {'key': 'teething_date', 'value': '歯が生えはじめたのはいつですか'},
          {'key': 'decay_position', 'value': '虫歯のある歯'},
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;

      case 'oneYears':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'cramped_walk_date', 'value': 'つたい歩きをしたのはいつですか'},
          {'key': 'is_hello_gesture', 'value': 'バイバイ、コンニチワなどの身振りをしますか'},
          {'key': 'is_swing_with_music', 'value': '音楽に合わせて、からだを楽しそうに動かしますか'},
          {'key': 'is_nutrition_weaning_smooth', 'value': '離乳は順調に進んでいますか'},
          {
            'key': 'is_understand_easy_word',
            'value': '大人の言う簡単な言葉（おいで、ちょうだい）がわかりますか'
          },
          {
            'key': 'is_turn_to_point_finger',
            'value': '部屋の離れたところにあるおもちゃを指さすと、その方向を見ますか'
          },
          {'key': 'is_happy_play_together', 'value': '一緒に遊ぶと喜びますか'},
          {'key': 'favorite_play', 'value': 'どんな遊びが好きですか'},
          {'key': 'is_rhythm_of_meal', 'value': '1日3回の食事のリズムがつきましたか'},
          {'key': 'is_dentifrice_practice', 'value': '歯みがきの練習を始めていますか'},
          {'key': 'teething_date', 'value': '歯が生えはじめたのはいつですか'},
          {'key': 'decay_position', 'value': '虫歯のある歯'},
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;

      case 'onehalfYears':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'walking_alone_date', 'value': 'ひとり歩きをしたのはいつですか'},
          {'key': 'is_mean_word_speak', 'value': 'ママ、ブーブーなど意味のある言葉をいくつか話しますか'},
          {'key': 'is_drinking_use_cup', 'value': '自分でコップを持って水を飲めますか'},
          {'key': 'is_use_baby_bottle', 'value': '哺乳ビンを使っていますか'},
          {'key': 'is_meal_time_fixed', 'value': '食事や間食（おやつ）の時間はだいたい決まっていますか'},
          {'key': 'is_teeth_finish_polish', 'value': '歯の仕上げみがきをしてあげていますか'},
          {
            'key': 'is_dazzling',
            'value': '極端に眩しがったり、目の動きがおかしいのではないかと気になったりしますか'
          },
          {'key': 'is_turn_to_call_from_back', 'value': '後ろから名前を呼んだとき、振り向きますか'},
          {'key': 'favorite_play', 'value': 'どんな遊びが好きですか'},
          {
            'key': 'is_use_fluorine_tooth_paste',
            'value': '歯にフッ化物（フッ素）の塗布やフッ素入り歯磨きの使用をしていますか'
          },
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;

      case 'twoYears':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'is_running', 'value': '走ることができますか'},
          {'key': 'is_eating_use_spoon', 'value': 'スプーンを使って自分で食べますか'},
          {
            'key': 'is_liken_use_block',
            'value': '積木で塔のようなものを作ったり、横に並べて電車などにみたてたりして遊ぶことをしますか'
          },
          {'key': 'is_gesture_imitate', 'value': 'テレビや大人の身振りのまねをしますか'},
          {
            'key': 'is_speak_twoword_sentence',
            'value': '2語文（ワンワンキタ、マンマチョウダイ）などを言いますか'
          },
          {'key': 'is_eat_meat_fiber_vegetables', 'value': '肉や繊維のある野菜を食べますか'},
          {'key': 'is_teeth_finish_polish', 'value': '歯の仕上げみがきをしてあげていますか'},
          {'key': 'favorite_play', 'value': 'どんな遊びが好きですか'},
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;

      case 'threeYears':
        confirmItemList = [
          {'key': 'report_date', 'value': '記録日'},
          {'key': 'birthday_message', 'value': '誕生日メッセージ'},
          {'key': 'is_climb_stairs_alone', 'value': '手を使わずにひとりで階段をのぼれますか'},
          {'key': 'is_circle_drawing', 'value': 'クレヨンなどで丸（円）を書きますか'},
          {'key': 'is_wear_clothes_alone', 'value': '衣服の着脱をひとりでしたがりますか'},
          {'key': 'is_speak_name', 'value': '自分の名前が言えますか'},
          {'key': 'is_dentifrice_handwash', 'value': '歯磨きや手洗いをしていますか'},
          {'key': 'is_teeth_finish_polish', 'value': '歯の仕上げみがきをしてあげていますか'},
          {'key': 'is_thumb_sucking', 'value': 'いつも指しゃぶりをしていますか'},
          {'key': 'is_chew_eat_habit', 'value': 'よくかんで食べる習慣はありますか'},
          {'key': 'is_squint', 'value': '斜視はありますか'},
          {'key': 'is_narrow_eyes', 'value': '物を見るとき目を細めたり、極端に近づけて見たりしますか'},
          {'key': 'is_deaf_suspicion', 'value': '耳の聞こえが悪いのではないかと気になりますか'},
          {'key': 'is_teeth_alignment', 'value': 'かみ合わせや歯並びで気になることがありますか'},
          {
            'key': 'is_use_fluorine_tooth_paste',
            'value': '歯にフッ化物（フッ素）の塗布やフッ素入り歯磨きの使用をしていますか'
          },
          {
            'key': 'is_playing_house_playing_hero',
            'value': 'ままごと、ヒーローごっこなど、ごっこ遊びができますか'
          },
          {'key': 'is_have_playing_friends', 'value': '遊び友達がいますか'},
          {'key': 'is_frank_adviser', 'value': '子育てについて気軽に相談できる人はいますか'},
          {
            'key': 'is_anxiety_child_rearing',
            'value': '子育てについて不安や困難を感じることはありますか'
          },
          {'key': 'memo', 'value': 'メモ'},
        ];
        break;
    }

    final list = <Widget>[];
    for (var i = 0; i < confirmItemList.length; i++) {
      list.add(
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 2)),
          ),
          margin: const EdgeInsets.symmetric(vertical: 2),
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(confirmItemList[i]['value']!),
              Text(
                "${parentReportUserSelectValueState[confirmItemList[i]["key"]]}",
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
              parentReportKind,
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
}
