import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '_components/schedule_after_recent_card_area.dart';
import '_components/schedule_after_recent_title.dart';
import '_components/schedule_recent_card_area.dart';

class VaccinationScheduleScreen extends StatelessWidget {
  const VaccinationScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: IHSColors.vaccinationScheduleBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            ScheduleRecentCardArea(
              recentStart: '2022/09/02',
              recentEnd: '2022/11/30',
            ),
            SizedBox(height: 16),
            ScheduleAfterRecentTitle(futureTitleMonth: 12),
            SizedBox(height: 16),
            ScheduleAfterRecentCardArea(
              afterRecentYear: 2022,
              afterRecentMonth: 12,
            ),
            SizedBox(height: 16),
            ScheduleAfterRecentCardArea(
              afterRecentYear: 2023,
              afterRecentMonth: 1,
            ),
            SizedBox(height: 16),
            ScheduleAfterRecentCardArea(
              afterRecentYear: 2023,
              afterRecentMonth: 2,
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
