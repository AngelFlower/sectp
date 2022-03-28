import 'package:flutter/material.dart';
import 'package:flutter_app/pages/fishTank/index.dart';
import 'package:flutter_app/pages/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    List<Widget> _pages = <Widget>[const FishTankIndex(), const MenuPage()];

    //return
    ///Consumer<Auth>(builder: (context, auth, child) {
    ///if (auth.isAuth) {
    return Scaffold(
      body: Container(
          color: Colors.grey.shade200, child: _pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
