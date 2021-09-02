import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:travel_journal/main.dart';

class JournalView extends StatefulWidget {
  JournalData jData;
  JournalView(this.jData);
  @override
  JournalViewState createState() => JournalViewState();
}

class JournalViewState extends State<JournalView>
    with TickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late Animation _colorTween;
  late Animation<double> _scaleTween;
  Color backArrowColor = Colors.white;
  late Animation<Offset> _offsetTween;
  @override
  void initState() {
    _scaleAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween =
        ColorTween(begin: Colors.transparent, end: Colors.black.withOpacity(1))
            .animate(_scaleAnimationController);
    _scaleTween = Tween<double>(
      begin: 1.0,
      end: 1.6,
    ).animate(_scaleAnimationController);

    _offsetTween = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 20.0))
        .animate(_scaleAnimationController);
    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels > MediaQuery.of(context).size.height * 0.60 &&
        backArrowColor == Colors.white) {
      setState(() {
        backArrowColor = Color(0xFF818899);
      });
    } else if (backArrowColor != Colors.white &&
        scrollInfo.metrics.pixels < MediaQuery.of(context).size.height * 0.60) {
      setState(() {
        backArrowColor = Colors.white;
      });
    }
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _scaleAnimationController.animateTo(
        (scrollInfo.metrics.pixels) / MediaQuery.of(context).size.height * 0.65,
        curve: Curves.fastOutSlowIn,
      );
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: NotificationListener<ScrollNotification>(
            onNotification: _scrollListener,
            child: Stack(
              children: <Widget>[
                AnimatedBuilder(
                    animation: _scaleAnimationController,
                    builder: (context, child) => Container(
                        color: Colors.white,
                        foregroundDecoration:
                            BoxDecoration(color: _colorTween.value),
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ScaleTransition(
                          scale: _scaleTween,
                          child: Stack(children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(6, 2, 6, 2),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(widget.jData.image,
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.fill)),
                            ),
                            Positioned(
                                bottom:
                                    MediaQuery.of(context).size.height * 0.050,
                                left:
                                    MediaQuery.of(context).size.height * 0.020,
                                child: Text(
                                  widget.jData.title,
                                  style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(1),
                                          offset: Offset(0, 0),
                                          blurRadius: 18,
                                        ),
                                      ],
                                      color: Colors.white,
                                      height: 1.4,
                                      fontFamily: 'Poppins',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.038,
                                      fontWeight: FontWeight.w700),
                                )),
                            Positioned(
                                bottom: 0,
                                left:
                                    MediaQuery.of(context).size.height * 0.022,
                                child: Text(
                                  'March 21, 2019',
                                  style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(1),
                                          offset: Offset(0, 0),
                                          blurRadius: 18,
                                        ),
                                      ],
                                      color: Colors.white,
                                      height: 5,
                                      fontFamily: 'Poppins',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.020,
                                      fontWeight: FontWeight.w400),
                                ))
                          ]),
                        ))),
                ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.transparent,
                          Colors.white54,
                          Colors.white
                        ],
                      ).createShader(Rect.fromLTRB(0, 40, 0, 100));
                    },
                    blendMode: BlendMode.colorDodge,
                    child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: IgnorePointer(
                            ignoring: true,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    backgroundBlendMode: BlendMode.exclusion),
                                margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.height * 0.65,
                                ),
                                child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 20, 20, 40),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Journal',
                                              style: TextStyle(
                                                  color: Color(0xFF20232F),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '▲ ',
                                                  style: TextStyle(
                                                      height: 0.6,
                                                      fontSize: 18,
                                                      color: Color(0xFF818899),
                                                      fontWeight:
                                                          FontWeight.w800),
                                                ),
                                                Text(
                                                  'Swipe up to read',
                                                  style: TextStyle(
                                                      height: 1,
                                                      fontSize: 12,
                                                      color: Color(0xFF818899),
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'At the end of September my brother met me in Tokyo for a week between leaving South Korea and going back home. We spent days exploring the city, eating our way through different suburbs and saw a heap of sites in a short amount of time. I thought I’d finally put together a little Tokyo Travel City Guide, including where to eat, where to visit and what to do for a short trip.If you haven’t seen it already, I also put together a video of our trip which gives a little bit of a deeper overview of what we got up to. As I was really focused on capturing video I would suggest checking it out after reading this post so you can get a better understanding. Tokyo is huge by the way (aka un-walkable) and a week was in no-way long enough to see everything so I suggest planning ahead if you have a short amount of time like we had! We stayed in the Granbell Hotel Shinjuku and while I didn’t get any photos inside of the actual hotel (oops) it really was a great place to stay. Located really close to a lot of restaurants and shopping malls in Shinjuku, as well as not being a 5 minute walk to a train station. Plus, there’s a rooftop bar with an awesome view for those nights when you can’t be bothered venturing too far away from home – see photo above. Finally the first Spring post this year! Tokyo’s cold gloomy winter was slowly transitioning to a warmer pre-spring weather when I was there on end March. This is my third time being in Tokyo around these months and having missed the cherry blossom seasons TWICE already, I hoped that I could get a chance to finally see the first trees blooming… and I did! Sadly I had to return before the full bloom so still no hanami experience, but fingers crossed for next year. It was also my first time wearing kimono #yay. I’ll rave about how much I love it and also skip about the difficulty in walking in it, in a moment.',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              color: Color(0xFF818899),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )))))),
                Positioned(child: LikeButton(), top: 16, right: 15),
                Positioned(
                    child: IconButton(
                      enableFeedback: true,
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: backArrowColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    top: 6,
                    left: 4),
                Positioned(
                    bottom: 16,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 50,
                      child: SlideTransition(
                          position: _offsetTween,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ))),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Edit Journal  ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                Icon(
                                  Icons.edit,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          )),
                    )),
              ],
              alignment: Alignment.topCenter,
            )));
  }
}
