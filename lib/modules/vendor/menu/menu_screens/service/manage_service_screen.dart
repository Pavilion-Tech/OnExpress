import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/layout/vendor/vendor_cubit/vendor_cubit.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../../../widgets/default_button.dart';
import '../../../../../widgets/filter_widget.dart';
import '../../../../../widgets/search_widget.dart';
import '../../../../buyer/widgets/service/list_service.dart';

class ManageServiceScreen extends StatelessWidget {
  ManageServiceScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      haveNotification: false,
      titleAppbar: tr('manage_services'),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: SearchWidget(
                onChanged: (String val){},
                filterTap: (){
                  showModalBottomSheet(
                      enableDrag: true,
                      shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                              topStart:  Radius.circular(20),
                              topEnd: Radius.circular(20)
                          )
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      context: context,
                      builder: (context) => FilterWidget(
                        doneTap:()=>Navigator.pop(context),
                        text: controller.text,
                      )
                  );
                },
                controller: controller
            ),
          ),
          Expanded(child: ListService(isProvider: true,)),
          DefaultButton(
            onTap: (){
              VendorCubit.get(context).changeIndex(2);
              Navigator.pop(context);
            },
            text: tr('add_new'),
          )
        ],
      ),
    );
  }
}
