import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/features/account/screens/account_screen.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual_home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart"),
    )
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: AppConstants.selectedNavBarColor,
        unselectedItemColor: AppConstants.unselectedNavBarColor,
        backgroundColor: AppConstants.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              child: Icon(Icons.home_outlined),
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 0
                          ? AppConstants.selectedNavBarColor
                          : AppConstants.backgroundColor,
                      width: bottomBarBorderWidth),
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              child: Icon(Icons.person_outlined),
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 1
                          ? AppConstants.selectedNavBarColor
                          : AppConstants.backgroundColor,
                      width: bottomBarBorderWidth),
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              child: Badge(
                label: Text("2"),
                child: Icon(Icons.shopping_cart),
                textColor: AppConstants.selectedNavBarColor,
                backgroundColor: AppConstants.backgroundColor,
              ),
              width: bottomBarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                      color: _page == 2
                          ? AppConstants.selectedNavBarColor
                          : AppConstants.backgroundColor,
                      width: bottomBarBorderWidth),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
