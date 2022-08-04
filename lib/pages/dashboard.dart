import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:vismaya/dummy/data.dart';
import 'package:vismaya/model/company.dart';
import 'package:vismaya/pages/video_player.dart';
import 'package:vismaya/widgets/featured/intro_page_item.dart';
import 'package:vismaya/widgets/featured/page_transformer.dart';
import 'package:vismaya/widgets/trailers/course_card.dart';
import '../widgets/genere_display.dart';
import 'movie_detail.dart';

class DashBoardPage extends StatefulWidget {
  DashBoardPage({
    Key? key,
    required this.title,
    required this.company,
  }) : super(key: key);

  final String title;
  final Vismaya company;

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  // String dashboardimage;
  var top = 0.0;
  bool _first = false;
  late Movie focussedMovie;
  //String frame2;

  @override
  void initState() {
    focussedMovie = sampleItems[0];

    ///frame2 = sampleItems[0].posterUrl;

    super.initState();
  }

  _changeTheImage(int index) {
    {
      setState(() {
        focussedMovie = sampleItems[index];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
        backgroundColor: Colors.black,
        body: NotificationListener(
            onNotification: (v) {
              if (v is ScrollUpdateNotification) {
                print('Scroll Update ${v.scrollDelta.toString()}');
                if (v.metrics.axisDirection != AxisDirection.left &&
                    v.metrics.axisDirection != AxisDirection.right)
                  setState(() => top -= v.scrollDelta! / 2);
              }
              return false;
            },
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: top,
                  child: ConstrainedBox(
                    constraints: new BoxConstraints(maxHeight: 620.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: focussedMovie.portrateThumbnail,
                      fit: BoxFit.fitWidth,
                    ),
                    /*Image.network(focussedMovie.portrateThumbnail,
                      fit: BoxFit.fitWidth,
                    ),*/
                  ),
                ),
                SingleChildScrollView(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      height: 1000.0,
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0.0, 0.0),
                          // 10% of the width, so there are ten blinds.
                          colors: [
                            Color(0xFF000000),
                            Color(0x8A000000),
                            Color(0x1F000000),
                            Color(0x1F000000),
                            Color(0x1F000000),
                            Color(0xDD000000),
                            Color(0xDD000000),
                            Color(0xFF000000),
                            Color(0xFF000000)
                          ],
                          // whitish to gray
                          tileMode: TileMode
                              .clamp, // repeats the gradient over the canvas
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _createLogoAvathar(),
                        Container(
                          margin: const EdgeInsets.only(top: 200),
                          child: Column(
                            children: <Widget>[
                              GenereWidjet(
                                generes: focussedMovie.genere,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            debugPrint('BUY CLICKED'),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            focussedMovie.price == null
                                                ? 'Free'
                                                : '${focussedMovie.price} \$',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoApp()),
                                          );
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "TRAILER",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/detail',
                                              arguments: focussedMovie);
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "INFO",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: const Text(
                                  'Featured Movies',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                color: Color(0x42000000),
                                alignment: Alignment.center,
                                child: Center(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromHeight(200.0),
                                    child: PageTransformer(
                                      pageViewBuilder:
                                          (context, visibilityResolver) {
                                        return PageView.builder(
                                          onPageChanged: (int index) =>
                                              _changeTheImage(index),
                                          controller: PageController(
                                              viewportFraction: 0.85),
                                          itemCount: sampleItems.length,
                                          itemBuilder: (context, index) {
                                            final item = sampleItems[index];
                                            final pageVisibility =
                                                visibilityResolver
                                                    .resolvePageVisibility(
                                                        index);

                                            return IntroPageItem(
                                              item: item,
                                              pageVisibility: pageVisibility,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: Text(
                                  'Upcomming Movie Trailers',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: _createCourseScroller(),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: Text(
                                  'First Day First Show',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: _createCourseScroller(),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    top: 4.0, left: 2.0, bottom: 4.0),
                                child: Text(
                                  'Top 10 Movies Based on your Search',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: _createCourseScroller(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            )));
  }

  Widget _createCourseScroller() {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(220.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.company.movies.length,
            itemBuilder: (BuildContext context, int index) {
              var course = widget.company.movies[index];
              return MoviePoster(course);
            }),
      ),
//      ),
    );
  }

  Widget _createLogoAvathar() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0, left: 10.0),
      padding: const EdgeInsets.all(3.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              widget.company.logo,
              width: 100.0,
              height: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Vismaya',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
//      ),
    );
  }
}
