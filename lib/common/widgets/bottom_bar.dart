import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:amazon_clone/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});
  static const String routeName = '/actualhome';

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  List<Widget> screens = [HomeScreen(), Placeholder(), Placeholder()];
  double bottomBarWidth = 42;
  double bottoBarBorderwidth = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int page) {
          setState(() {
            _page = page;
          });
        },
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: bottoBarBorderwidth,
                      color: _page == 0
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: bottoBarBorderwidth,
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const Icon(Icons.person),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      width: bottoBarBorderwidth,
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor),
                ),
              ),
              child: const badges.Badge(
                badgeContent: Text('2'),
                child: Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
