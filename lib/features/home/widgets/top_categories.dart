import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/features/home/screens/category_deals_screens.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});
  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreens.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          itemCount: AppConstants.categoryImages.length,
          scrollDirection: Axis.horizontal,
          itemExtent: 70,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigateToCategoryPage(
                  context, AppConstants.categoryImages[index]["title"]!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        AppConstants.categoryImages[index]["image"]!,
                        fit: BoxFit.cover,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                  Text(
                    AppConstants.categoryImages[index]["title"]!,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            );
          }),
    );
  }
}
