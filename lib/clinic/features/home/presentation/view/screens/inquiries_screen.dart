import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_cubit.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_state.dart';
import 'package:dental_clinics_app/clinic/features/patients/presentation/view/widgets/list_tile_patient.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InquiriesScreen extends StatefulWidget {
  const InquiriesScreen({super.key});

  @override
  State<InquiriesScreen> createState() => _InquiriesScreenState();
}

class _InquiriesScreenState extends State<InquiriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.inquiries),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeWithDataState) {
              return ListView.separated(
                itemCount: state.inquiries.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, i) {
                  return ListTilePatient(inquiry: state.inquiries[i]);
                },
              );
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
