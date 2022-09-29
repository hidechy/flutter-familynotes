import 'package:flutter/material.dart';
import 'package:tab_container/tab_container.dart';

import '../../layouts/main_layouts.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';
import '../_components/family_notes_text_button.dart';
import 'vaccination_already_screen.dart';
import 'vaccination_schedule_screen.dart';

class VaccinationScreen extends StatelessWidget {
  const VaccinationScreen({Key? key}) : super(key: key);

  List<Widget> vaccinationTabs(BuildContext context) => <Widget>[
        Text(
          '接種予定',
          style: IHSTextStyle.small,
        ),
        Text(
          '接種済',
          style: IHSTextStyle.small,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MainLayouts(
      title: '予防接種',
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(8),
            child: DefaultTextStyle(
              style: IHSTextStyle.small,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('佐藤　花子ちゃん'),
                  SizedBox(height: 8),
                  Text('○○○○年○○月○○日　生まれ'),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabContainer(
              color: IHSColors.selectPanelBackgroundColor1,
              childPadding: const EdgeInsets.all(8),
              tabs: vaccinationTabs(context),
              isStringTabs: false,
              children: vaccinationContents(),
            ),
          ),
          const SizedBox(height: 16),
          FamilyNotesTextButton(
            buttonTextLine1: 'ワクチン副反応の記録',
            onPress: () {},
          ),
          FamilyNotesTextButton(
            buttonTextLine1: '罹患歴の記録',
            onPress: () {},
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  List<Widget> vaccinationContents() {
    return <Widget>[
      const VaccinationScheduleScreen(),
      const VaccinationAlreadyScreen(),
    ];
  }
}
