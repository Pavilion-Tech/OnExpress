import 'package:flutter/material.dart';

import '../../../widgets/default_scaffold.dart';
import '../widgets/order/single_order/invoice_widget.dart';
import '../widgets/order/single_order/order_details.dart';
import '../widgets/order/single_order/vendor_track_widget.dart';

class VendorTrackScreen extends StatelessWidget {
  const VendorTrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      titleAppbar: '#352365',
      haveNotification: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            OrderDetails(),
            TrackWidget(title: 'Processing',),
            InvoiceWidget()
          ],
        ),
      ),
    );
  }
}
