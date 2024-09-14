import 'package:flutter/material.dart';
import 'package:mood_diary/core/core.dart';

class NoteTextfield extends StatefulWidget {
  const NoteTextfield({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<NoteTextfield> createState() => _NoteTextfieldState();
}

class _NoteTextfieldState extends State<NoteTextfield> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double queryData = mediaQuery.textScaleFactor;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(bottom: width * 0.09333),
      child: Container(
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: StyleComponents().boxShadow(context: context),
        ),
        child: TextFormField(
          controller: widget.controller,
          textInputAction: TextInputAction.done,
          style: textTheme.titleLarge?.copyWith(
            color: blackClr,
            fontSize: 14 / queryData,
          ),
          minLines: 4,
          maxLines: null,
          decoration: InputDecoration(
            isDense: true,
            hintText: 'Введите заметку',
            hintStyle: TextStyle(
              color: greyClr2,
              fontFamily: fontApp,
              fontWeight: FontWeight.w600,
              fontSize: 14 / queryData,
            ),
            filled: true,
            fillColor: whiteClr,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(width * 0.02564),
            ),
          ),
        ),
      ),
    );
  }
}
