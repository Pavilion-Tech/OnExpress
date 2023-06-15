import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_express/modules/buyer/store/store_screen.dart';
import 'package:on_express/widgets/story/user_info.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../image_net.dart';
import 'animated_bar.dart';
import 'models/story_model.dart';
import 'models/user_model.dart';



class StoryWidget extends StatefulWidget {
  List<Story> stories;


  StoryWidget({required this.stories});

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget>
    with SingleTickerProviderStateMixin {
   PageController? _pageController;
   AnimationController? _animController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    _loadStory(animateToPage: false);

    _animController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController!.stop();
        _animController!.reset();
        setState(() {
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory();
          } else {

            bool lastPage = _pageController!.page == widget.stories.length;
            lastPage
                ? _pageController!.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)
                : Navigator.pop(context);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController!.dispose();
    _animController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.stories;
    return SafeArea(
      child: GestureDetector(
        onTapDown: (details) => _onTapDown(details),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.stories.length,
              itemBuilder: (context, i) {
                final Story story = widget.stories[i];
                return ImageNet(image: story.url);
              },
            ),
            Positioned(
              left: 10.0,
              right: 10.0,
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      navigateTo(context,StoreScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1.5,
                        vertical: 10.0,
                      ),
                      child: UserInfo(user:story[0].user),
                    ),
                  ),
                  Row(
                    children: widget.stories
                        .asMap()
                        .map((i, e) {
                      return MapEntry(
                        i,
                        AnimatedBar(
                          animController: _animController!,
                          position: i,
                          currentIndex: _currentIndex,
                        ),
                      );
                    })
                        .values
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    bool firstPage = _pageController!.page !=0.0;
    bool lastPage = _pageController!.page == widget.stories.length;
    if (dx < screenWidth / 3) {
      setState(() {
        if(myLocale == 'en'){
          if (_currentIndex - 1 >= 0) {
            _currentIndex -= 1;
            _loadStory();
          }else{
            firstPage
                ? _pageController!.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)
                : Navigator.pop(context);
          }
        }else{
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory();
          } else {
            lastPage
                ? _pageController!.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)
                : Navigator.pop(context);
          }
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if(myLocale == 'en'){
          if (_currentIndex + 1 < widget.stories.length) {
            _currentIndex += 1;
            _loadStory();
          } else {
            lastPage
                ? _pageController!.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)
                : Navigator.pop(context);
          }
        }else{
          if (_currentIndex - 1 >= 0) {
            _currentIndex -= 1;
            _loadStory();
          }else{
            firstPage
                ? _pageController!.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut)
                : Navigator.pop(context);
          }
        }

      });
    }
  }

  void _loadStory({bool animateToPage = true}) {
    _animController!.stop();
    _animController!.reset();
    _animController!.duration = const Duration(seconds: 8);
    _animController!.forward();
    if (animateToPage) {
      _pageController!.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}



