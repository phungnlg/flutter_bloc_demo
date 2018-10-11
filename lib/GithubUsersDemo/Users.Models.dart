class User {
  String login;
  int id;
  String avatarUrl;
  double score;

  User(this.login, this.id, this.avatarUrl, this.score);

  User.fromJson(Map json)
      : login = json['login'],
        id = json['id'],
        avatarUrl = json['avatar_url'],
        score = json['score'];
}