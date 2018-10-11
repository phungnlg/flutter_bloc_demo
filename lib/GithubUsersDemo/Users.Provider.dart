import 'package:bloc_example/GithubUsersDemo/Users.Services.dart';
import 'package:bloc_example/MoviesDemo/Movies.Models.dart';
import 'package:bloc_example/GithubUsersDemo/Users.BLoC.dart';

import 'package:flutter/widgets.dart';

class UserProvider extends InheritedWidget {
  final UserBloc userBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static UserBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(UserProvider) as UserProvider)
          .userBloc;

  UserProvider({Key key, UserBloc userBloc, Widget child})
    : this.userBloc = userBloc ?? UserBloc(UsersAPI()),
      super(child: child, key: key);
}