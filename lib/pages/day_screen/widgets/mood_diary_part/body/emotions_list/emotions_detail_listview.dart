import 'package:flutter/material.dart';
import 'emotions_detail_card.dart';

class EmotionsDetailListView extends StatelessWidget {
  const EmotionsDetailListView({
    super.key,
    required this.emotionsValues,
    required this.selectedEmotion,
    required this.emotionDetailSelected,
    required this.emotionDetailSelect,
  });

  final List emotionsValues;
  final int selectedEmotion;
  final List<int> emotionDetailSelected;
  final Function emotionDetailSelect;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.8205,
      height: width * 0.3528,
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
              emotionsValues[selectedEmotion][1].length,
              (index) => EmotiomsDetailCard(
                index: index,
                emotionsValues: emotionsValues,
                selectedEmotion: selectedEmotion,
                emotionDetailSelected: emotionDetailSelected,
                emotionDetailSelect: emotionDetailSelect,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
