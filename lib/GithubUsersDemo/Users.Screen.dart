import 'package:bloc_example/GithubUsersDemo/Users.Provider.dart';

import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = UserProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Example'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: userBloc.query.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for an user',
              ),
            ),
          ),
          Flexible(
            child: StreamBuilder(
              stream: userBloc.results,
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
                          snapshot.data[index].avatarUrl ?? ""),
                    ),
                    title: Text(snapshot.data[index].login),
                    subtitle: Text('Score: ' + snapshot.data[index].score.toString()),
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