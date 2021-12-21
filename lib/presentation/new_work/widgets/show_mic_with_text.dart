import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:social_media_recorder/presentation/new_work/provider/sound_record_notifier.dart';

class ShowMicWithText2 extends StatelessWidget {
  final bool shouldShowText;
  final String? slideToCancelText;
  final SoundRecordNotifier soundRecorderState;
  final TextStyle? slideToCancelTextStyle;
  final Widget? recordIcon;
  ShowMicWithText2({
    required this.shouldShowText,
    required this.soundRecorderState,
    required this.slideToCancelTextStyle,
    required this.slideToCancelText,
    required this.recordIcon,
  });
  final colorizeColors = [
    Colors.black,
    Colors.grey.shade200,
    Colors.black,
  ];
  final colorizeTextStyle = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: soundRecorderState.buttonPressed ? 1.2 : 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(600),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  width: soundRecorderState.buttonPressed ? 50 : 35,
                  height: soundRecorderState.buttonPressed ? 50 : 35,
                  child: Container(
                    color: (soundRecorderState.buttonPressed)
                        ? Theme.of(context).accentColor
                        : Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: recordIcon ??
                          Icon(
                            Icons.mic,
                            size: 28,
                            color: (soundRecorderState.buttonPressed)
                                ? Colors.grey.shade200
                                : Colors.black,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (shouldShowText)
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: DefaultTextStyle(
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    slideToCancelText ?? "",
                    textStyle: slideToCancelTextStyle ?? colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                onTap: () {},
              ),
            ),
          ),
      ],
    );
  }
}
