import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:like_button/like_button.dart';
import 'journal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      theme: ThemeData(
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF20232F)))),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class JournalData {
  var title;
  var image;
  var date;
  var description;

  JournalData(this.title, this.image, this.date, this.description);
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _index = 0;
  final List<JournalData> journalList = [
    JournalData('Trip to Tokyo', 'images/bg_tokyo.jpeg', 'March 21, 2019',
        'At the end of September my brother met me in Tokyo for a week between leaving South Korea and going back home. We spent days exploring the city, eating our way through different suburbs and saw a heap of sites in a short amount of time. I thought I’d finally put together a little Tokyo Travel City Guide, including where to eat, where to visit and what to do for a short trip.If you haven’t seen it already, I also put together a video of our trip which gives a little bit of a deeper overview of what we got up to. As I was really focused on capturing video I would suggest checking it out after reading this post so you can get a better understanding. Tokyo is huge by the way (aka un-walkable) and a week was in no-way long enough to see everything so I suggest planning ahead if you have a short amount of time like we had! We stayed in the Granbell Hotel Shinjuku and while I didn’t get any photos inside of the actual hotel (oops) it really was a great place to stay. Located really close to a lot of restaurants and shopping malls in Shinjuku, as well as not being a 5 minute walk to a train station. Plus, there’s a rooftop bar with an awesome view for those nights when you can’t be bothered venturing too far away from home – see photo above. Finally the first Spring post this year! Tokyo’s cold gloomy winter was slowly transitioning to a warmer pre-spring weather when I was there on end March. This is my third time being in Tokyo around these months and having missed the cherry blossom seasons TWICE already, I hoped that I could get a chance to finally see the first trees blooming… and I did! Sadly I had to return before the full bloom so still no hanami experience, but fingers crossed for next year. It was also my first time wearing kimono #yay. I’ll rave about how much I love it and also skip about the difficulty in walking in it, in a moment.'),
    JournalData('Trip to Itaewon', 'images/bg_itaewon.jpeg', 'August 7, 2019',
        'At the end of September my brother met me in Tokyo for a week between leaving South Korea and going back home. We spent days exploring the city, eating our way through different suburbs and saw a heap of sites in a short amount of time. I thought I’d finally put together a little Tokyo Travel City Guide, including where to eat, where to visit and what to do for a short trip.If you haven’t seen it already, I also put together a video of our trip which gives a little bit of a deeper overview of what we got up to. As I was really focused on capturing video I would suggest checking it out after reading this post so you can get a better understanding. Tokyo is huge by the way (aka un-walkable) and a week was in no-way long enough to see everything so I suggest planning ahead if you have a short amount of time like we had! We stayed in the Granbell Hotel Shinjuku and while I didn’t get any photos inside of the actual hotel (oops) it really was a great place to stay. Located really close to a lot of restaurants and shopping malls in Shinjuku, as well as not being a 5 minute walk to a train station. Plus, there’s a rooftop bar with an awesome view for those nights when you can’t be bothered venturing too far away from home – see photo above. Finally the first Spring post this year! Tokyo’s cold gloomy winter was slowly transitioning to a warmer pre-spring weather when I was there on end March. This is my third time being in Tokyo around these months and having missed the cherry blossom seasons TWICE already, I hoped that I could get a chance to finally see the first trees blooming… and I did! Sadly I had to return before the full bloom so still no hanami experience, but fingers crossed for next year. It was also my first time wearing kimono #yay. I’ll rave about how much I love it and also skip about the difficulty in walking in it, in a moment.'),
  ];
  late AnimationController _controllerA;
  late AnimationController _controllerB;
  var squareScaleA = 1.0;
  var squareScaleB = 0.9;
  @override
  void initState() {
    _controllerA = AnimationController(
        vsync: this,
        lowerBound: 0.9,
        upperBound: 1.0,
        duration: Duration(milliseconds: 200));
    _controllerB = AnimationController(
        vsync: this,
        lowerBound: 0.9,
        upperBound: 1.0,
        duration: Duration(milliseconds: 200));
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
      });
    });
    _controllerA.addListener(() {
      setState(() {
        squareScaleB = _controllerB.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget bigCircle = Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        // Max Size
        CustomPaint(
          painter: MakeRing(radius: 150, X: -50, Y: -20),
        ),
        CustomPaint(
          painter: MakeRing(radius: 300, X: -122, Y: -92),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'images/kimdami.jpeg',
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 12,
                    spreadRadius: -6,
                    offset: Offset(-2, 3), // Shadow position
                  ),
                ],
              ),
              width: 50,
              height: 50,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(20, 40, 20, 10),
              child: SvgPicture.asset('images/icons/settings.svg'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xfff9f9f9),
              ),
              width: 50,
              height: 50,
            )
          ],
        ),
        CustomPaint(
          painter: MakeRing(radius: 450, X: -196, Y: -168),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(10, 110, 0, 0),
          child: Text(
            'Your\nJournals',
            style: TextStyle(
                height: 0.9,
                color: Color(0xFF20232F),
                fontFamily: 'Poppins',
                fontSize: MediaQuery.of(context).size.height * 0.050,
                fontWeight: FontWeight.w800),
          ),
        ),
        Container(
            margin: EdgeInsets.fromLTRB(0, 230, 0, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: PageView.builder(
                    itemCount: journalList.length,
                    controller: PageController(viewportFraction: 0.76),
                    onPageChanged: (int index) => {
                      setState(() => _index = index),
                      _controllerB.reverse(from: squareScaleA),
                      _controllerA.forward(from: squareScaleB),
                    },
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? squareScaleA : squareScaleB,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          JournalView(journalList[i])),
                                );
                              },
                              child: Center(
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.asset(journalList[i].image,
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.fill)),
                                    Positioned(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.050,
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.020,
                                        child: Text(
                                          journalList[i].title,
                                          style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 18,
                                                ),
                                              ],
                                              color: Colors.white,
                                              height: 1.4,
                                              fontFamily: 'Poppins',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.038,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    Positioned(
                                        bottom: 0,
                                        left:
                                            MediaQuery.of(context).size.height *
                                                0.022,
                                        child: Text(
                                          journalList[i].date,
                                          style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black
                                                      .withOpacity(1),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                              color: Colors.white,
                                              height: 5,
                                              fontFamily: 'Poppins',
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.020,
                                              fontWeight: FontWeight.w400),
                                        )),
                                    Positioned(
                                        child: LikeButton(),
                                        top: 12,
                                        right: 10),
                                  ],
                                  alignment: Alignment.bottomLeft,
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
        Stack(children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width * 0.95,
            height: 55,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.87,
                MediaQuery.of(context).size.width * 0.1,
                0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(
                    'images/icons/download.svg',
                    width: 100,
                  ),
                  SvgPicture.asset(
                    'images/icons/image.svg',
                    width: 100,
                  ),
                ]),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 36,
                  spreadRadius: -6,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
              borderRadius: BorderRadius.circular(15),
              color: Color(0xffffffff),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.848,
                MediaQuery.of(context).size.width * 0.1,
                0),
            child: SvgPicture.asset(
              'images/icons/add.svg',
              height: 90,
              allowDrawingOutsideViewBox: true,
              width: 90,
            ),
          ),
        ]),
      ],
    );

    Widget bigCircle2 = Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        CustomPaint(
          painter: MakeRing(radius: 180, X: -90, Y: -130),
        ),
        CustomPaint(
          painter: MakeRing(radius: 360, X: -180, Y: -220),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                bigCircle2,
                bigCircle,
              ],
              fit: StackFit.passthrough,
            )
          ],
        ),
      ),
    );
  }
}

class MakeRing extends CustomPainter {
  final double radius;
  final double X;
  final double Y;

  MakeRing({required this.radius, required this.X, required this.Y});

  final _paint = Paint()
    ..color = Color(0xFFF5F5F5)
    ..strokeWidth = 35
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(X, Y, radius, radius),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
