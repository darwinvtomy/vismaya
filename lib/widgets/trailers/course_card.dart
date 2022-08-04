import 'package:flutter/material.dart';
import 'package:vismaya/model/company.dart';
import 'package:transparent_image/transparent_image.dart';
class MoviePoster extends StatelessWidget {
  final Movie movie;

  MoviePoster(this.movie);

  BoxDecoration _createShadowRoundCorners() {
    return BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black26, spreadRadius: 2.0, blurRadius: 10.0)
        ]);
  }

  Widget _createThumbnail() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child:FadeInImage.memoryNetwork(
        width: 125,
        placeholder: kTransparentImage,
        image: movie.portrateThumbnail,
        fit: BoxFit.cover,
      ),
      /*Image.network(
        movie.portrateThumbnail,
        fit: BoxFit.cover,
      ),*/
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /* padding: const EdgeInsets.all(8.0),*/
      margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 16.0),
      decoration: _createShadowRoundCorners(),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/detail',arguments: movie);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: _createThumbnail(),
            ),
            /*      Flexible(
              flex: 2,
              child: _createCourseInfo(),
            )*/
          ],
        ),
      ),
    );
  }

}
