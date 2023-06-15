import 'package:flutter/material.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../../widgets/menu/chat/bottom_chat.dart';
import '../../widgets/menu/chat/chat_appbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: chatAppbar(title: 'Name Of Provider',context: context),
      child: SizedBox(),
      bottomSheet: BottomChat(),
    );
  }
}
