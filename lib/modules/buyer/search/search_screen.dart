import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/widgets/service/list_service.dart';
import 'package:on_express/widgets/default_scaffold.dart';
import 'package:on_express/widgets/search_widget.dart';

import '../../../widgets/filter_widget.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      haveArrow: false,
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
            Expanded(child: ListService())
          ],
        )
    );
  }
}
