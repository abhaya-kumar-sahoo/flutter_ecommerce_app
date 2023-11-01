import 'package:amazon/common/widgets/loader.dart';
import 'package:amazon/features/search/service/search_services.dart';
import 'package:amazon/models/product_modal.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search_screen";
  final String searchQuery;
  const SearchScreen({super.key, required this.searchQuery});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getSearchData() async {
    products = await searchServices.fetchSearchProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? Loader()
        : Scaffold(
            body: Center(child: Text(widget.searchQuery)),
          );
  }
}
