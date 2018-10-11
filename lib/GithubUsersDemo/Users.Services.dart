import 'dart:async';
import 'dart:convert';

import 'package:bloc_example/GithubUsersDemo/Users.Models.dart';
import 'package:http/http.dart' as http;

class UsersAPI {
  final http.Client _client = http.Client();

  static const String _url = 'https://api.github.com/search/users?q={1}';


  Future<List<User>> get(String query) async {
    List<User> list = [];

    await _client
        .get(Uri.parse(_url.replaceFirst('{1}', query)))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json['items'])
        .then((users) =>
        users.forEach((user) => list.add(User.fromJson(user)))
    );

    list.sort((a, b) {
      return a.login.toLowerCase().compareTo(b.login.toLowerCase());
    });

    return list;
  }
}