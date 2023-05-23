import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';

import '../shared/components/constants.dart';
import 'intro_screen.dart';

class Intro1 extends StatefulWidget {
  Intro1(this.model);
  IntroModel model;

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  double x =size!.width*.9,y=(size!.height - size!.height*1.0)/2,scale = 1.0;
  double x2 =size!.width*.9,y2=(size!.height - size!.height*1.0)/2;
  bool menuOpen= false;
  double? backIntro1Height = 0 , backIntro1Width = 0;
  @override
  void initState() {
    Future.delayed(Duration.zero,(){
      x = 0;y=0;
      x2 = 0;y2=0;
      backIntro1Height = 500;backIntro1Width = size!.width;
      setState(() {});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 450),
          transform: Matrix4.translationValues(x , y, 0)..scale(scale),
          child: Text(
            widget.model.title,
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 34,color: Colors.grey.shade800),
          ),
        ),
        const SizedBox(height: 5,),
        AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.elasticInOut,
          transform: Matrix4.translationValues(x , y, 0)..scale(scale),
          child: Text(
            widget.model.desc,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 600),
                      transform: Matrix4.translationValues(x , y, 0)..scale(scale),
                      child: Image.asset(widget.model.imageBackground2))
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 600),
                  height: backIntro1Height,width: backIntro1Width,
                  child: Image.asset(widget.model.imageBackground)),
              AnimatedContainer(
                  duration: Duration(milliseconds: 450),
                  transform: Matrix4.translationValues(x , y, 0)..scale(scale),
                  child: Image.asset(widget.model.image,height: 500,)),
            ],
          ),
        ),
      ],
    );
  }
}
