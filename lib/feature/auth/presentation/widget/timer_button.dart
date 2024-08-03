import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerButton extends StatefulWidget {
  final String buttonText;
  final String buttonOnTimerRunText;
  final Function()? onPressed;
  final Function()? onTimerEnd;
  final bool showTimerInButtonText;
  final Duration timerDuration;
  final bool Function()? validate;
  final ButtonStyle? buttonStyle;
  final Duration incrementToNextClickDuration;
  final int? clickLimits;
  final String? limitsReachedText;
  final String timerFormat;
  final bool withMilliseconds;

  /// Кнопка с таймером. По нажатию на кнопку стартует таймер с [timerDuration].
  /// При этом кнопка некликабельна во время действия таймера. До начала отсчёта вызывается [onPressed]
  /// После вызывается [onTimerEnd]
  /// Когда таймер активен, на кнопке отображается текст [buttonOnTimerRunText], когда неактивен - [buttonText].
  /// [showTimerInButtonText] флаг для показа счётчика времени в кнопке
  /// [validate] служит для того, если нужно обработать нажатие только по некоторому условию
  /// [incrementToNextClickDuration] нужен, чтобы увеличивать количество времени после каждого нажатия
  /// по умолчанию 0
  /// [clickLimits] ограничение по нажатиям. [limitsReachedText] текст на кнопке, когда ограничение достигнуто
  const TimerButton(
      {super.key,
      this.onPressed,
      this.onTimerEnd,
      this.buttonText = 'Нажмите',
      this.buttonOnTimerRunText = 'Ждите',
      this.showTimerInButtonText = true,
      this.validate,
      this.buttonStyle,
      this.clickLimits,
      this.limitsReachedText,
      this.timerFormat = 'mm:ss',
      this.incrementToNextClickDuration = Duration.zero,
      this.timerDuration = const Duration(minutes: 1),
      this.withMilliseconds = false});

  @override
  State<StatefulWidget> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  Timer? timer;
  bool get isTimerRunned => timer?.isActive ?? false;
  late Duration currentDuration;
  late Duration timerDuration;
  int clickCount = 0;

  @override
  void initState() {
    super.initState();
    timerDuration = widget.timerDuration;
    currentDuration = widget.timerDuration;
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final buttonMainText =
        isTimerRunned ? widget.buttonOnTimerRunText : widget.buttonText;
    final limitReachedText = widget.limitsReachedText ?? buttonMainText;
    final clickLimits = widget.clickLimits;
    bool isClicksReachLimit = clickLimits != null && clickCount >= clickLimits;
    final text =
        '${!isClicksReachLimit ? buttonMainText : limitReachedText} ${_timeToString(currentDuration, isTimerRunned && widget.showTimerInButtonText, widget.timerFormat, widget.withMilliseconds)}';
    return TextButton(
        style: widget.buttonStyle,
        onPressed: isTimerRunned || isClicksReachLimit
            ? null
            : () {
                if (widget.validate?.call() ?? true) {
                  clickCount++;
                  widget.onPressed?.call();
                  timer = Timer.periodic(const Duration(seconds: 1), (t) {
                    setState(() {
                      if (currentDuration > Duration.zero) {
                        currentDuration -= const Duration(seconds: 1);
                      } else {
                        t.cancel();
                        widget.onTimerEnd?.call();
                        timerDuration += widget.incrementToNextClickDuration;
                        currentDuration = timerDuration;
                      }
                    });
                  });
                }
              },
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              color: widget.buttonStyle?.foregroundColor?.resolve({})),
        ));
  }

  // Делает то же самое, но через dateTime и с форматтером
  String _timeToString(Duration duration,
      [bool showTime = true,
      String pattern = 'mm:ss',
      bool withMilliseconds = false]) {
    final days = duration.inDays.remainder(365);
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    final millis = duration.inMilliseconds.remainder(1000);
    final micros = duration.inMicroseconds.remainder(1000);
    final dateTime =
        DateTime(2024, 1, days, hours, minutes, seconds, millis, micros);
    final millisecondsFormat = withMilliseconds ? '.$millis' : '';
    return showTime
        ? DateFormat(pattern).format(dateTime) + millisecondsFormat
        : '';
  }
}
