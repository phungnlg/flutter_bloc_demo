import 'package:bloc_example/GithubUsersDemo/Users.BLoC.dart';
import 'package:bloc_example/GithubUsersDemo/Users.Services.dart';
import 'package:flutter/material.dart';

import 'package:bloc_example/MoviesDemo/Movies.Provider.dart';

import 'package:bloc_example/GithubUsersDemo/Users.Provider.dart';

import 'package:bloc_example/GithubUsersDemo/Users.Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProvider(
        userBloc: UserBloc(UsersAPI()),
        child: UserScreen(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieBloc = MovieProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: movieBloc.query.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for a Movie',
              ),
            ),
          ),
          StreamBuilder(
            stream: movieBloc.log,
            builder: (context, snapshot) => Container(
                  child: Text(snapshot?.data ?? ''),
                ),
          ),
          Flexible(
            child: StreamBuilder(
              stream: movieBloc.results,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w92" +
                                      snapshot.data[index].posterPath ??
                                  ""),
                        ),
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].overview),
                      ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
