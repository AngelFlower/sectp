import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/pages/user/show.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:flutter_app/services/http_service.dart';
import 'package:flutter_app/utils/animations.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  Future<User> getUser() async {
    final response = await HttpService().get(url: 'user', auth: true);
    return User.fromJson(response['data']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: false,
            title: Text(
              "Menu",
              style: Theme.of(context).textTheme.headline1,
            )),
        body: Center(
          child: SafeArea(
            minimum: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                FutureBuilder<User>(
                    future: getUser(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListTile(
                          title: Text(snapshot.data!.name),
                          leading: const Icon(Icons.person),
                          onTap: () {
                            Navigator.of(context).push(Animations().createRoute(
                                page: UserShowPage(user: snapshot.data!)));
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    }),
                ListTile(
                  title: const Text("Logout"),
                  onTap: () {
                    Auth().logout();
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'login', (route) => false);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
