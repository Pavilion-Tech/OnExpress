import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../widgets/order/order_filter.dart';
import '../widgets/order/order_history_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      haveArrow: false,
        titleAppbar: tr('my_bookings'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderFilter(),
            const SizedBox(height: 20,),
            Expanded(child: OrderHistoryWidget())
          ],
        )
    );
  }
}
