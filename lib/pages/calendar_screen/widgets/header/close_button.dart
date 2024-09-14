import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mood_diary/config/config.dart';
import 'package:mood_diary/core/core.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return IconButton(
      onPressed: () => GetIt.I<AppRouter>().popForced(),
      icon: Icon(
        MoodDiaryIcons.closeIcon,
        size: width * 0.042667,
        color: greyClr1,
      ),
    );
  }
}
