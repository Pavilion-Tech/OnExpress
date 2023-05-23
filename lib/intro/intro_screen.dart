import 'package:flutter/material.dart';
import 'package:on_express/intro/intro1.dart';
import 'package:on_express/shared/images/images.dart';
import 'package:on_express/shared/styles/colors.dart';
import 'package:on_express/widgets/default_scaffold.dart';

import '../shared/components/components.dart';
import 'intro2.dart';

class IntroModel {
  String title;
  String desc;
  String image;
  String imageBackground;
  String imageBackground2;
  IntroModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.imageBackground,
    required this.imageBackground2,
});
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<IntroModel> intros = [
    IntroModel(
        image: Images.intro1,
        title: 'Welcome To Our Services App',
        desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ',
        imageBackground:Images.backIntro1,
      imageBackground2: Images.subBackIntro1
    ),
    IntroModel(
        image: Images.intro2,
        title: 'Here You Can Get Services Needed',
        desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ',
        imageBackground:Images.backIntro2,
        imageBackground2:Images.subBackIntro2
    ),
  ];

  int currentPage  = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions:[
            TextButton(
                onPressed: (){},
                child: Text(
                  'Skip',style: TextStyle(color: Colors.white),
                )
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Intro1(intros[0]),
                    Intro2(intros[1]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2, (index) => currentPage == index
                      ? customIndicatorOn(): customIndicatorOff()),
                ),
              ),
              Row(
                children: [
                  if(currentPage == 1)
                  InkWell(
                    onTap: (){
                      pageController.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInBack
                      );
                      setState(() {
                        currentPage = 0;
                      });
                    },
                    child: Container(
                      height: 45,width: 45,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,color: defaultColor,
                      ),
                      child: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,),
                    ),
                  ),
                  const Spacer(),
                  if(currentPage == 0)
                    InkWell(
                      onTap: (){
                        pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInBack
                        );
                        setState(() {
                          currentPage = 1;
                        });
                      },
                      child: Container(
                      height: 45,width: 45,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,color: defaultColor,
                      ),
                      child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                  ),
                    ),
                  if(currentPage == 1)
                    TextButton(
                        onPressed: (){},
                        child: Row(
                          children: [
                            Text(
                              'To Homepages',
                              style: TextStyle(fontSize: 12,color: Colors.black),
                            ),
                            const SizedBox(width: 5,),
                            Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)
                          ],
                        )
                    )
                ],
              )
            ],
          ),
        )
    );
  }
}
