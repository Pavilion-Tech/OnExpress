import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/widgets/default_button.dart';

import '../../../layout/vendor/vendor_layout.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/styles/colors.dart';
import '../../../widgets/otp_widget.dart';

class ProviderVerification extends StatefulWidget {
  ProviderVerification({Key? key}) : super(key: key);

  @override
  State<ProviderVerification> createState() => _ProviderVerificationState();
}

class _ProviderVerificationState extends State<ProviderVerification> {
  TextEditingController c1 = TextEditingController();

  TextEditingController c2 = TextEditingController();

  TextEditingController c3 = TextEditingController();

  TextEditingController c4 = TextEditingController();

  int _start = 60;

  bool timerFinished = false;

  late Timer timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            timerFinished = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  bool checkCode() {
    String codeFromOtp = c1.text +
        c2.text +
        c3.text +
        c4.text;
    print(codeFromOtp);
    return int.parse(myLocale == 'en'
        ? codeFromOtp
        : String.fromCharCodes(codeFromOtp.runes.toList().reversed)) ==
        code;
  }

  bool checkOTP() {
    if (c1.text.isEmpty ||
        c2.text.isEmpty ||
        c3.text.isEmpty ||
        c4.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  void submit(BuildContext context) {
    navigateAndFinish(context, VendorLayout());
    if (checkOTP()) {
      if (checkCode()) {
        //AuthCubit.get(context).verify(context);
      } else {
        showToast(msg: tr('code_invalid'), toastState: true);
      }
    } else {
      showToast(msg: tr('code_empty'), toastState: true);
    }
  }
  @override
  void initState() {
    showToast(msg: '${tr('code_is')} $code');
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 500,
        child: Stack(
          children: [
            Container(color: defaultColor,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(200)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 30,right: 30,bottom: 30),
              child: Column(
                children: [
                  Image.asset(Images.verification,width: 147,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OTPWidget(
                          controller: c1,
                          autoFocus: myLocale == 'en'?true:false,
                          onFinished: () {
                            if (checkOTP() && myLocale != 'en') {
                              submit(context);
                            }
                          },
                        ),
                        OTPWidget(
                          controller: c2,
                        ),
                        OTPWidget(
                          controller: c3,
                        ),
                        OTPWidget(
                          controller: c4,
                          autoFocus: myLocale == 'ar'?true:false,
                          onFinished: () {
                            if (checkOTP() && myLocale != 'ar') {
                              submit(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  DefaultButton(
                    text: tr('verify'),
                    onTap: (){submit(context);},
                    width: size!.width*.75,
                  ),
                  const SizedBox(height: 20,),
                  if (!timerFinished)
                    Text(
                      '00:$_start',
                    ),
                  if (timerFinished)
                    InkWell(
                      onTap: () {
                       // AuthCubit.get(context).login();
                        timer;
                        _start = 60;
                        timerFinished = false;
                        startTimer();
                      },
                      child: Text(
                        tr('try_again'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
