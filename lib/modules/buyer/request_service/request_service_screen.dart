import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_express/layout/buyer/buyer_cubit/buyer_cubit.dart';
import 'package:on_express/layout/buyer/buyer_cubit/buyer_states.dart';
import 'package:on_express/modules/buyer/widgets/request_service/choose_shift.dart';
import 'package:on_express/widgets/default_button.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../widgets/request_service/choose_address.dart';
import '../widgets/request_service/choose_date.dart';
import '../widgets/request_service/describe_problem.dart';
import '../widgets/request_service/service_details.dart';
import '../widgets/request_service/success_dialog.dart';

class RequestServiceScreen extends StatelessWidget {
  const RequestServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BuyerCubit, BuyerStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultScaffold(
            titleAppbar: 'Home cleaning',
            haveNotification: false,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ServiceDetails(),
                  ChooseDate(),
                  ChooseShift(),
                  ChooseAddress(),
                  DescribeProblem(),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 40),
                    child: DefaultButton(
                      text: tr('send_request'),
                      onTap: () {
                        showModalBottomSheet(
                            enableDrag: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(20),
                                    topEnd: Radius.circular(20)
                                )
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            context: context,
                            isDismissible: false,
                            builder: (context) => SuccessDialog()
                        );
                      },
                    ),
                  )
                ],
              ),
            )
        );
      },
    );
  }
}
