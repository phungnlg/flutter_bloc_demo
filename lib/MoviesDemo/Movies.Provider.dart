import 'package:bloc_example/MoviesDemo/Movies.Models.dart';
import 'package:bloc_example/MoviesDemo/Movies.BLoC.dart';

import 'package:flutter/widgets.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider)
          .movieBloc;

  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? MovieBloc(MoviesAPI()),
        super(child: child, key: key);
}
