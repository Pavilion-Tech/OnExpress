import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/widgets/store/store_details.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../widgets/default_button.dart';
import '../../../widgets/filter_widget.dart';
import '../../../widgets/search_widget.dart';
import '../widgets/home/category.dart';
import '../widgets/service/list_service.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  StoreDetails(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: SearchWidget(
                      controller: controller,
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
                    ),
                  ),
                  Category(),
                  const SizedBox(height: 30),
                  ListService(shrinkWrap: true),
                ],
              ),
            ),
            DefaultButton(
              onTap: (){},
              text: 'Special Request',
            )
          ],
        )
    );
  }
}
