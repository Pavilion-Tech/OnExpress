import 'package:flutter/material.dart';
import 'package:on_express/modules/buyer/widgets/service/list_service.dart';
import 'package:on_express/widgets/default_scaffold.dart';
import 'package:on_express/widgets/search_widget.dart';

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
                  filterTap: ()=>Navigator.pop(context),
                  controller: controller
              ),
            ),
            Expanded(child: ListService())
          ],
        )
    );
  }
}
