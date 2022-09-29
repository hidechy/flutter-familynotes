import 'package:family_notes/screens/settings/type.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../layouts/main_layouts.dart';
import '../../style/colors.dart';
import '../../style/text_style.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  List<SettingItemType> get itemTypes => [
        SettingItemType.childInput,
        SettingItemType.profile,
        SettingItemType.profileRegister,
        SettingItemType.individual,
        SettingItemType.poricy,
        SettingItemType.terms,
        SettingItemType.logout,
        SettingItemType.withdrawal,
      ];

  @override
  Widget build(BuildContext context) {
    return MainLayouts(
      title: '設定',
      body: GroupedListView<SettingItemType, String>(
        elements: itemTypes,
        groupBy: (element) => element.group,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: EdgeInsets.zero,
          child: ColoredBox(
            color: IHSColors.mainContainerColor,
            child: Text(
              ' ',
              style: IHSTextStyle.medium,
            ),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: SizedBox(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                leading: Icon(element.iconData),
                title: Text(element.title),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => element.onTapAction(context),
              ),
            ),
          );
        },
      ),
    );
  }
}
