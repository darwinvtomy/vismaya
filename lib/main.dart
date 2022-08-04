import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vismaya/pages/dashboard.dart';
import 'package:vismaya/pages/movie_detail.dart';

import 'dummy/repo.dart';
import 'model/company.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      color: Colors.black,
      title: 'Vismaya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: routes,
    );
  }

  Route? routes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (context) {
            return DashBoardPage(
              title: 'Vismaya',
              company: RepoData.bawp,
            );
          });
        }
        break;
      case '/detail':
        {
          final Movie movie = settings.arguments as Movie;

          return MaterialPageRoute(builder: (context) {
            return MovieDetails(
              movie: movie,
            );
          });
        }
    }
  }
}
