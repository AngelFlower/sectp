import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/pages/user/edit.dart';
import 'package:flutter_app/utils/animations.dart';

class UserShowPage extends StatelessWidget {
  const UserShowPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  Animations().createRoute(
                      page: UserEditPage(
                    user: user,
                  )));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 18.0),
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(user.image)),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              height: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              user.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              user.email,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
