import 'package:dental_clinics_app/clinic/features/home/domain/entities/inquiry_entity.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_cubit.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_state.dart';
import 'package:dental_clinics_app/core/componeents/circle_widget.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/global/global_services.dart';
import 'package:dental_clinics_app/core/helper/helper.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTilePatient extends StatelessWidget {
  final InquiryEntity inquiry;
  const ListTilePatient({super.key, required this.inquiry});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      leading: CircleWidget(
        text: inquiry.patientName.substring(0, 1).toUpperCase(),
        horizontal: 20,
        vertical: 15,
      ),
      title: Text(
        inquiry.patientName,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      subtitle: Text(
        inquiry.inquiry,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: SizedBox(
        width: 25,
        height: 25,
        child: GestureDetector(
          onTap: () {
            context
                .read<HomeCubit>()
                .updateInquiry(
                  role: GlobalServices.role,
                  docId: GlobalServices.user.docId,
                  docIdInquiry: inquiry.docIdInquiry,
                )
                .then((isSuccess) {
                  if (isSuccess) {
                    Uri uri = Uri.parse(
                      "https://wa.me/${inquiry.phone}?text=Hello *${inquiry.patientName}*,\nregarding inquiry sent via the *DentalGo* app: \n<< ${inquiry.inquiry} >>\n We are pleased to answer your inquiry",
                    );
                    Helper.launch(uri);
                  }
                });
          },
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoadingInquiryState &&
                  state.docIdInquiry == inquiry.docIdInquiry) {
                return const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.iconColor,
                    ),
                  ),
                );
              } else {
                return SvgWidget(
                  icon: inquiry.replied ? "chat" : "mark_unread_chat_alt",
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
