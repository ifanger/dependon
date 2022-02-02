import 'package:dependon/dependon.dart';
import 'package:flutter/material.dart';

import '../../repository/user/model/user.dart';
import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeBloc _homeBloc = get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DependOn"),
      ),
      body: Center(
        child: _buildUsers(),
      ),
    );
  }

  StreamBuilder<List<User>?> _buildUsers() {
    return StreamBuilder<List<User>?>(
        initialData: null,
        stream: _homeBloc.userStream,
        builder: (_, snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          } else {
            final List<User> users = snapshot.data!;

            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, position) {
                  final User user = users[position];

                  return Text(user.name);
                });
          }
        });
  }
}
