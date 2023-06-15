import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/modules/vendor/menu/menu_screens/chat/vendor_chat_screen.dart';
import 'package:on_express/shared/components/components.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/widgets/default_scaffold.dart';

class VendorChatHistoryScreen extends StatelessWidget {
  const VendorChatHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      haveNotification: false,
      titleAppbar: tr('chat_history'),
      child: ListView.separated(
          itemBuilder: (c,i)=>VendorChatHistoryItem(),
          separatorBuilder: (c,i)=>const SizedBox(height: 30,),
          itemCount: 5
      ),
    );
  }
}


class VendorChatHistoryItem extends StatelessWidget {
  const VendorChatHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, VendorChatScreen());
      },
      child: Row(
        children: [
          Container(
            height: 83,width: 83,
            decoration: BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.product2,fit: BoxFit.cover,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Store NameStore NameStore NameStore Name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    'The last message sentThe last message sentThe last message sentThe last message sent',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12,color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '21/7/2022',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}

