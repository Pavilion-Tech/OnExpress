import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../widgets/order/single_order/invoice_widget.dart';
import '../widgets/order/single_order/list_order_items.dart';
import '../widgets/order/single_order/order_details.dart';

class VendorOrderScreen extends StatelessWidget {
  const VendorOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      titleAppbar: '#352365',
      haveNotification: false,
      child: Column(
        children: [
          OrderDetails(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: ListOrderItems(),
          ),
          const Spacer(),
          InvoiceWidget()
        ],
      ),
    );
  }
}
