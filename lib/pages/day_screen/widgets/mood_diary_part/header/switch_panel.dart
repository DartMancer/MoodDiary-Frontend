import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class SwitchPanel extends StatelessWidget {
  const SwitchPanel({
    super.key,
    required this.isDiary,
    required this.setDiaryType,
    required this.setStatsType,
  });

  final bool isDiary;
  final Function setDiaryType, setStatsType;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.08),
      child: SizedBox(
        width: width * 0.768,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.768 / 2,
                  height: width * 0.09,
                  decoration: BoxDecoration(
                    color: greyClr4,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.12533),
                      bottomLeft: Radius.circular(width * 0.12533),
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () => setDiaryType(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width * 0.12533),
                        bottomLeft: Radius.circular(width * 0.12533),
                      ),
                    ),
                    child: const SwitcherButtonContent(
                      title: 'Дневник',
                      icon: MoodDiaryIcons.diaryIcon,
                      isStat: false,
                    ),
                  ),
                ),
                Container(
                  width: width * 0.768 / 2,
                  height: width * 0.09,
                  decoration: BoxDecoration(
                    color: greyClr4,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(width * 0.12533),
                      bottomRight: Radius.circular(width * 0.12533),
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () => setStatsType(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(width * 0.12533),
                        bottomRight: Radius.circular(width * 0.12533),
                      ),
                    ),
                    child: const SwitcherButtonContent(
                      title: 'Статистика',
                      icon: MoodDiaryIcons.statsIcon,
                      isStat: true,
                    ),
                  ),
                ),
              ],
            ),
            ActiveButton(isDiary: isDiary),
          ],
        ),
      ),
    );
  }
}

class ActiveButton extends StatelessWidget {
  const ActiveButton({
    super.key,
    required this.isDiary,
  });

  final bool isDiary;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return AnimatedPositioned(
      left: isDiary ? 0 : width - width * 0.65867,
      right: !isDiary ? 0 : width - width * 0.68867,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutCubic,
      child: AnimatedContainer(
        width: width * 0.68867,
        height: width * 0.09,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: mainClr,
          borderRadius: BorderRadius.circular(width * 0.12533),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isDiary ? MoodDiaryIcons.diaryIcon : MoodDiaryIcons.statsIcon,
              size: width * 0.035,
              color: whiteClr,
            ),
            SizedBox(width: width * 0.03),
            SizedBox(
              height: width * 0.05,
              child: AnimatedCrossFade(
                firstChild: ASText(
                  text: 'Дневник настроения',
                  color: whiteClr,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
                secondChild: ASText(
                  text: 'Статистика',
                  color: whiteClr,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                ),
                crossFadeState: isDiary
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
                sizeCurve: Curves.easeInCubic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitcherButtonContent extends StatelessWidget {
  const SwitcherButtonContent({
    super.key,
    required this.title,
    required this.icon,
    required this.isStat,
  });

  final String title;
  final IconData icon;
  final bool isStat;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isStat ? SizedBox(width: width * 0.04) : const SizedBox.shrink(),
        Icon(
          icon,
          size: width * 0.03,
          color: greyClr2,
        ),
        SizedBox(width: width * 0.02),
        SizedBox(
          height: width * 0.05,
          child: ASText(
            text: title,
            color: greyClr2,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
