import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../widgets/home/filter_statistics_widget.dart';
import '../widgets/home/highlight.dart';
import '../widgets/home/home_item_widget.dart';
import '../widgets/home/vendor_details.dart';

class VendorHomeScreen extends StatelessWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        haveNotification: false,
        haveArrow: false,
        child:SingleChildScrollView(
          child: Column(
            children: [
              VendorDetails(),
              Padding(
                padding: const EdgeInsets.only(top: 28.0,bottom: 40),
                child: HighLights(),
              ),
              FilterStatisticsWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: HomeItemWidget(
                  title: '${tr('product')},${tr('count')}',
                  count:'10',
                ),
              ),
              HomeItemWidget(
                title: '${tr('order')},${tr('count')}',
                count:'10',
              ),
              const SizedBox(height: 20,),
              HomeItemWidget(
                title: tr('total_revenue'),
                count:'10 AED',
              ),
              const SizedBox(height: 100,),
            ],
          ),
        )
    );
  }
}
