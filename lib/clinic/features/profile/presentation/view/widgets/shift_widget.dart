import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/extensions/int_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/extensions/string_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/time_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:flutter/material.dart';

class ShiftWidget extends StatefulWidget {
  final SlotEntities shift;
  final DayScheduleEntities day;
  const ShiftWidget({super.key, required this.shift, required this.day});

  @override
  State<ShiftWidget> createState() => _ShiftWidgetState();
}

class _ShiftWidgetState extends State<ShiftWidget> {
  late List<SlotEntities> _slots;
  late String _nameOfShift;
  init() {
    _slots = [];
    _nameOfShift = "";
    final durationTimeString = widget.day.appointmentDuration.replaceAll(
      RegExp(r"[^0-9]"),
      "",
    );
    final durationTime = int.parse(durationTimeString);
    final startTime = widget.shift.startTime;
    final endtime = widget.shift.endTime;
    int currentMint = startTime.timeToMints();
    final endLimitTime = endtime.timeToMints();
    debugPrint("current time=====================>>>>>>>>>>>>> $currentMint");
    if (currentMint < 720 && endLimitTime < 720) {
      _nameOfShift = "Morning";
    } else if (currentMint <= 720 && endLimitTime < 1020) {
      _nameOfShift = "Afternoon";
    } else if (currentMint < 1020 && endLimitTime < 1020) {
      _nameOfShift = "Afternoon";
    } else {
      _nameOfShift = "Evening";
    }

    while (currentMint + durationTime <= endLimitTime) {
      _slots.add(SlotEntities(startTime: currentMint.mintsToTime()));
      currentMint += durationTime;
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShiftWidget oldWidget) {
    init();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(text: _nameOfShift),
        SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: _slots
              .map((slot) => TimeWidget(time: slot.startTime))
              .toList(),
        ),
      ],
    );
  }
}
