import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../widgets/default_scaffold.dart';
import '../widgets/order/vendor_order_history.dart';

class VendorOrderHistoryScreen extends StatelessWidget {
  const VendorOrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        haveArrow: false,
        haveNotification: false,
        titleAppbar: tr('bookings_history'),
        child: VendorOrderHistoryWidget()
    );
  }
}
