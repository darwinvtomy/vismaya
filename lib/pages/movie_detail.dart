import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vismaya/model/company.dart';
import 'package:vismaya/widgets/cast_list_text.dart';
import 'package:vismaya/widgets/genere_display.dart';
import 'package:vismaya/widgets/text_bubble_display.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;

  const MovieDetails({required this.movie});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetails> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.black,
        body: NotificationListener(
          onNotification: (v) {
            if (v is ScrollUpdateNotification) {
              print('Scroll Update ${v.scrollDelta.toString()}');
              if (v.metrics.axisDirection != AxisDirection.left &&
                  v.metrics.axisDirection != AxisDirection.right)
                setState(() => top -= v.scrollDelta! / 3);
            }
            return false;
          },
          child: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.passthrough,
            children: <Widget>[
              Positioned(
                width: MediaQuery.of(context).size.width,
                top: top,
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      widget.movie.portrateThumbnail,
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: 10,
                      bottom: 150,
                      left: 30,
                      right: 100,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 210),
                scrollDirection: Axis.vertical,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Container(
                      height: 700,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment(0.0, 0.0),
                          // 10% of the width, so there are ten blinds.
                          colors: [
                            const Color(0x00000000),
                            const Color(0x8A000000),
                            const Color(0xDD000000),
                            const Color(0xDD000000),
                            const Color(0xFF000000),
                          ],
                          tileMode: TileMode
                              .clamp, // repeats the gradient over the canvas
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 70),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.play_circle_filled,
                                size: 90.0,
                                color: Colors.white24,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  widget.movie.title.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w300),
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                                SizedBox(
                                  height: 13.0,
                                ),
                                GenereWidjet(generes: widget.movie.genere),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      widget.movie.price == null
                                          ? 'Free'
                                          : '${widget.movie.price} \$',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.right,
                                      softWrap: true,
                                    ),
                                    BubblesText(
                                        arrayString: widget.movie.languages),
                                  ],
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    widget.movie.price == null
                                        ? Icons.play_arrow
                                        : Icons.shopping_cart,
                                    size: 40.0,
                                    color: Colors.white60,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            widget.movie.discription,
                            style: TextStyle(
                                color: Colors.white70, fontSize: 16.0),
                            textAlign: TextAlign.right,
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Director',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                            ),
                            textAlign: TextAlign.right,
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          CastWidjet(
                            casts: widget.movie.directors,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Star Cast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                            ),
                            textAlign: TextAlign.right,
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          CastWidjet(
                            casts: widget.movie.starCast,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'Release Date',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                            ),
                            textAlign: TextAlign.right,
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 1.0,
                          ),
                          Text(
                            widget.movie.releaseDate.toString(),
                            style: TextStyle(
                                color: Colors.white70, fontSize: 16.0),
                            textAlign: TextAlign.right,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 50, left: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white60,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
