import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/features/home/widgets/address_box.dart';
import 'package:amazon/features/home/widgets/carousal_image.dart';
import 'package:amazon/features/home/widgets/deal_of_day.dart';
import 'package:amazon/features/home/widgets/top_categories.dart';
import 'package:amazon/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    void navigateToSearchScreen(String query) {
      Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: AppConstants.appBarGradient),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 42,
                      margin: const EdgeInsets.only(left: 15),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: 1,
                        child: TextFormField(
                          onFieldSubmitted: navigateToSearchScreen,
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 23,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(top: 10),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.black38, width: 1),
                              ),
                              hintText: "Search product ...",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.mic,
                      color: Colors.black,
                      size: 25,
                    ),
                  )
                ]),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            SizedBox(
              height: 10,
            ),
            TopCategories(),
            SizedBox(
              height: 10,
            ),
            CarousalImage(),
            SizedBox(
              height: 10,
            ),
            DealOfDay()
          ],
        ),
      ),
    );
  }
}
