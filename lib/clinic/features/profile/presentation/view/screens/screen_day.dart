import 'package:dental_clinics_app/clinic/features/profile/data/data_source/local_data/profile_local_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/add_another_block_button.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/app_bar_day.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/apply_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_day_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/duration_time_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/time_block_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/turn_day_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDay extends StatefulWidget {
  const ScreenDay({super.key});

  @override
  State<ScreenDay> createState() => _ScreenDayState();
}

class _ScreenDayState extends State<ScreenDay> {
  late List<SlotEntities> _slots;
  late GlobalKey<AnimatedListState> _key;
  @override
  void initState() {
    _slots = [];
    _key = GlobalKey<AnimatedListState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is SuccessDayProfileState) {
          AppSnackBar.showSuccess(context, msg: "Day saved successfully");
        }
      },
      child: Scaffold(
        appBar: AppBarDay(),
        bottomNavigationBar: BottomDayWidget(slots: _slots),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TurnDayWidget(),
              SizedBox(height: 30),
              AppText(text: "Time blocks"),
              SizedBox(height: 10),
              AnimatedList(
                key: _key,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                initialItemCount: _slots.length,
                itemBuilder: (context, i, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: TimeBlockWidget(
                      slot: _slots[i],

                      removeTap: () {
                        final item = _slots[i];
                        _key.currentState!.removeItem(i, ((context, animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            child: TimeBlockWidget(slot: item),
                          );
                        }), duration: Duration(seconds: 1));
                        _slots.removeAt(i);
                      },
                    ),
                  );
                },
              ),
              // TimeBlockWidget(),
              SizedBox(height: 20),
              AddAnotherBlockButton(
                onTap: () {
                  _slots.insert(
                    0,
                    SlotEntities(
                      startTime: TimeOfDay.now().format(context),
                      endTime: TimeOfDay.now().format(context),
                    ),
                  );
                  _key.currentState!.insertItem(
                    0,
                    duration: Duration(seconds: 1),
                  );
                },
              ),
              SizedBox(height: 30),
              AppText(text: "Appointment duration"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: ProfileLocalDataSourceIml()
                    .getStaticDurations()
                    .map((duration) => DurationTimeWidget(duration: duration))
                    .toList(),
              ),
              SizedBox(height: 30),
              ApplyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
