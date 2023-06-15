import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/styles/colors.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('sub_total'),
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '20 AED',
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
                ),
                const SizedBox(height: 10,),
                Text(
                  tr('vat'),
                  style: TextStyle(fontSize:9),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            Text(
              tr('shipping_charges'),
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
            ),
            const Spacer(),
            Text(
              '20 AED',
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.shade200,
          ),
        ),
        Row(
          children: [
            Text(
              tr('order_total'),
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: defaultColor),
            ),
            const Spacer(),
            Text(
              '20 AED',
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),
            ),
          ],
        ),
        const SizedBox(height: 40,),
      ],
    );
  }
}
