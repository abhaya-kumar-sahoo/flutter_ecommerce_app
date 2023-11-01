import 'package:amazon/common/widgets/loader.dart';
import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/features/home/services/home_services.dart';
import 'package:amazon/models/product_modal.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreens extends StatefulWidget {
  static const String routeName = "category_deals";
  final String category;
  const CategoryDealsScreens({super.key, required this.category});

  @override
  State<CategoryDealsScreens> createState() => _CategoryDealsScreensState();
}

class _CategoryDealsScreensState extends State<CategoryDealsScreens> {
  List<Product>? categoryProduct;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategoryProducts();
  }

  void fetchCategoryProducts() async {
    categoryProduct = await homeServices.fetchCategoryProduct(
        context: context, category: widget.category);
    setState(() {});
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
          title: Text(
            widget.category,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: categoryProduct == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    "Keep shopping or ${widget.category}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryProduct!.length,
                    padding: const EdgeInsets.only(left: 15),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 1.4,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final product = categoryProduct![index];
                      print(product.images);
                      return Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(
                                  product.images[0],
                                  width: double.maxFinite,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 0, top: 5, right: 15),
                            child: Text(
                              product.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
