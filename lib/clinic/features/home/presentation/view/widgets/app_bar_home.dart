import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/dialog_select_language.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is LoadedUserInfoProfileState) {
          return AppAppBar(
            leadingWidth: 0,
            title: context.arb.hello,
            subtitle: state.user!.name,
            listTileLeading: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset("assets/icons/teath.svg"),
            ),
            centerTitle: false,
            leading: SizedBox(),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DialogSelectLanguage(),
                  );
                },
                icon: Icon(Icons.language),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
            ],
          );
        } else if (state is LoadingUserInfoProfileState) {
          return AppAppBar(
            leadingWidth: 0,
            title: context.arb.hello,
            subtitle: "Loading...",
            listTileLeading: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset("assets/icons/teath.svg"),
            ),
            centerTitle: false,
            leading: SizedBox(),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DialogSelectLanguage(),
                  );
                },
                icon: Icon(Icons.language),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
            ],
          );
        } else {
          return AppAppBar(
            leadingWidth: 0,
            title: context.arb.hello,
            subtitle: "Unknown",
            listTileLeading: Padding(
              padding: const EdgeInsets.all(3.0),
              child: SvgPicture.asset("assets/icons/teath.svg"),
            ),
            centerTitle: false,
            leading: SizedBox(),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DialogSelectLanguage(),
                  );
                },
                icon: Icon(Icons.language),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),
            ],
          );
        }
      },
    );
  }
}
