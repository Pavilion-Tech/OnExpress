import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../../widgets/menu/chat/vendor_bottom_chat.dart';
import '../../../widgets/menu/chat/vendor_chat_appbar.dart';

class VendorChatScreen extends StatelessWidget {
  const VendorChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: vendorChatAppbar(title: 'Store Name',context: context),
      child: SizedBox(),
      bottomSheet: VendorBottomChat(),
    );
  }
}
