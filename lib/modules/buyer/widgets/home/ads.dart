import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:on_express/shared/images/images.dart';

import '../../../../shared/components/components.dart';
import '../../../../shared/styles/colors.dart';

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {

  CarouselController controller = CarouselController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: controller,
          items: [
            AdsItem(),
            AdsItem()
          ],
          options: CarouselOptions(
            onPageChanged: (int page, CarouselPageChangedReason changedReason) {
              setState(() {
                _index = page;
              });
            },
            height: 126,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            viewportFraction: 1,
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 20,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(2, (index) => _index == index
                    ? customIndicatorOn(): customIndicatorOff()),
              ),
            )
        ),
      ],
    );
  }
}


class AdsItem extends StatelessWidget {
  const AdsItem({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126,width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(20),
        color: defaultColor
      ),
      padding: EdgeInsetsDirectional.all(20),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get the best Worker',
                  maxLines: 2,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 19),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Tempora ad quia praesentium unde doloribus amet. ',
                    maxLines: 2,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 11),
                  ),
                ),
                Text(
                  '+201122711137',
                  maxLines: 1,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10,),
          Container(
            height: 82,width: 82,
            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(Images.intro2),
          ),
        ],
      ),
    );
  }
}
