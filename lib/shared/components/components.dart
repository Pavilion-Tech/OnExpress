import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../modules/buyer/menu/menu_screens/notification_screen.dart';
import '../images/images.dart';
import '../styles/colors.dart';
import 'constants.dart';

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false,
  );
}

// Future<XFile?> checkImageSize (XFile? image)async{
//   if(image!=null) {
//     final bytes = (await image.readAsBytes()).lengthInBytes;
//     final kb = bytes / 1024;
//     final mb = kb / 1024;
//     if(mb<5.0){
//       return image;
//     }else {
//       showToast(msg: tr('image_size'));
//       return null;
//     }
//   }
// }

Future<void> openUrl(String url) async {
  print(url);
  if(await canLaunchUrl(Uri.parse(url))){
    await launchUrl(Uri.parse(url));
  }else{
    showToast(msg: 'This Url can\'t launch');
  }}




Future showToast ({required String msg , bool? toastState})
{
 return Fluttertoast.showToast(
   msg: msg,
   toastLength: Toast.LENGTH_LONG,
   gravity: ToastGravity.BOTTOM,
   timeInSecForIosWeb: 5,
   textColor: Colors.white,
   fontSize: 16.0,
   backgroundColor: toastState != null
       ? toastState ?Colors.yellow[900]
       : Colors.red : Colors.green,
 );
}



checkNet(context) {
  if (!isConnect!) {
    //navigateTo(context,const NoNetScreen(),);
  }
}


Widget customIndicatorOn() =>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 4.0),
  child:Container(
    height: 5,width: 18,
    decoration: BoxDecoration(
      color: HexColor('#FFDC61'),
      borderRadius: BorderRadiusDirectional.circular(26)
    ),
  ),
);
Widget customIndicatorOff()=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 4.0),
  child:   CircleAvatar(radius: 3,backgroundColor: Colors.white,),
);


PreferredSizeWidget defaultAppbar({
  String title = '',
  required BuildContext context,
  bool haveNotification = true,
  bool haveArrow = true,
}){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: haveArrow?IconButton(
      onPressed: ()=>Navigator.pop(context),
      icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
    ):null,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: defaultTextColor),
    ),
    actions: [
      if(haveNotification)
      IconButton(
          onPressed: (){
            navigateTo(context, NotificationScreen());
          },
          icon: Image.asset(Images.notification,width: 20,)
      )
    ],
  );
}
