import 'dart:async';

import 'package:bloc_example/GithubUsersDemo/Users.Models.dart';
import 'package:bloc_example/GithubUsersDemo/Users.Services.dart';

import 'package:rxdart/rxdart.dart';

class UserBloc {
  final UsersAPI api;

  Stream<List<User>> _results = Stream.empty();
  BehaviorSubject<String> _query = BehaviorSubject<String>();

  Stream<List<User>> get results => _results;
  Sink<String> get query => _query;

  UserBloc(this.api) {
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}