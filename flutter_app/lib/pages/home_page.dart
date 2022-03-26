import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:flutter_app/widgets/list_fish_tanks.dart';
import 'package:flutter_app/widgets/list_tempetures.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    //_attemptAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    List<Widget> _pages = <Widget>[
      listFishTanks(context),
      //listTemperatures(context),
      const Icon(
        Icons.chat,
        size: 150,
      ),
      const Icon(
        Icons.chat,
        size: 150,
      ),
      const Icon(
        Icons.chat,
        size: 150,
      ),
    ];

    //return
    ///Consumer<Auth>(builder: (context, auth, child) {
    ///if (auth.isAuth) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_saver_off_outlined),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
    //} else {
    //  Navigator.pushNamed(context, 'login');
    //}
    //return CircularProgressIndicator();
    //});
  }
}
