import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.08),
      child: Row(
        children: [
          SizedBox(
            height: width * 0.062667,
            child: ASText(
              text: label,
              color: blackClr,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
