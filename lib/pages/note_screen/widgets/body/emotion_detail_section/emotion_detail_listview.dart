import 'package:flutter/material.dart';

import 'emotion_detail_card.dart';

class EmotionsDetailListView extends StatelessWidget {
  const EmotionsDetailListView({
    super.key,
    required this.emotionsValues,
  });

  final List emotionsValues;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.8205,
      height: width * 0.2528,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        padding: EdgeInsets.only(
          top: width * 0.04128,
          bottom: width * 0.04128,
        ),
        children: [
          Wrap(
            children: List.generate(
              emotionsValues.length,
              (index) => EmotiomsDetailCard(
                index: index,
                emotionsValues: emotionsValues,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
