import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/features/admin/screens/post_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    PostScreen(),
    const Center(
      child: Text("Analytis page"),
    ),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: AppConstants.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Text(
                "Admin",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
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
              child: Icon(Icons.analytics),
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
              child: Icon(Icons.all_inbox_outlined),
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
