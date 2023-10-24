import 'dart:io';

import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/common/widgets/custom_textfiled.dart';
import 'package:amazon/constants/app_constants.dart';
import 'package:amazon/constants/utils.dart';
import 'package:amazon/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = "/add-product";
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityNameController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  String category = "Mobile";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityNameController.dispose();
  }

  List<File> images = [];
  final _addProductKey = GlobalKey<FormState>();
  List<String> productCategories = [
    "Mobile",
    "Essentials",
    "Appliances",
    "Book",
    "Fashion"
  ];
  void sellProduct() {
    if (_addProductKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          quantity: double.parse(quantityNameController.text),
          price: double.parse(priceController.text),
          category: category,
          images: images);
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
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
          title: Text(
            "Add Project",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((e) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    e,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ));
                        }).toList(),
                        options:
                            CarouselOptions(viewportFraction: 1, height: 200))
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          dashPattern: [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Select Product Images",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    controller: productNameController,
                    hintText: "Product name"),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLine: 7,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantityNameController, hintText: "Quantity"),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: priceController, hintText: "Price"),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: DropdownButton(
                    items: productCategories.map((String e) {
                      return DropdownMenuItem(
                        child: Text(e),
                        value: e,
                      );
                    }).toList(),
                    value: category,
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(text: "Sell", onTap: sellProduct)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
