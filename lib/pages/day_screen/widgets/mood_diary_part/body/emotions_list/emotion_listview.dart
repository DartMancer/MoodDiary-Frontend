import 'package:flutter/material.dart';

import 'emotion_card.dart';
import 'emotions_detail_listview.dart';

class EmotionsListview extends StatelessWidget {
  const EmotionsListview({
    super.key,
    required this.emotionsList,
    required this.selectedEmotion,
    required this.emotionDetailSelected,
    required this.chooseMainEmotion,
    required this.emotionDetailSelect,
  });

  final Map<String, List> emotionsList;
  final int selectedEmotion;
  final List<int> emotionDetailSelected;
  final Function chooseMainEmotion, emotionDetailSelect;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    List<String> emotionsKeys = emotionsList.keys.toList();
    List<List<dynamic>> emotionsValues = emotionsList.values.toList();
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.096),
      child: Column(
        children: [
          SizedBox(
            height: width * 0.31467,
            child: ListView.builder(
              physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              itemCount: emotionsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(right: width * 0.032),
                  child: Stack(
                    children: [
                      EmotionCard(
                        index: index,
                        emotionsKeys: emotionsKeys,
                        emotionsValues: emotionsValues,
                        selectedEmotion: selectedEmotion,
                      ),
                      SizedBox(
                        width: width * 0.22133,
                        height: width * 0.31467,
                        child: MaterialButton(
                          onPressed: () => chooseMainEmotion(index: index),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              width * 0.202667,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          selectedEmotion >= 0
              ? EmotionsDetailListView(
                  emotionsValues: emotionsValues,
                  selectedEmotion: selectedEmotion,
                  emotionDetailSelected: emotionDetailSelected,
                  emotionDetailSelect: emotionDetailSelect,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
