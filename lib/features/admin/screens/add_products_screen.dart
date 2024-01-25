import 'dart:io';

import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/globalvariables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/auth/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductsScreen extends StatefulWidget {
  static const String routeName = '/add_products_screen';
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  final TextEditingController productNamecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController quantitycontroller = TextEditingController();

  List<File> images = [];

  AdminServices adminServices = AdminServices();

  final _addProductFormKey = GlobalKey<FormState>();

  String defaultCategory = 'Mobiles';

  List<String> categories = [
    'Mobiles',
    'Appliances',
    'Essentials',
    'Fashion',
    'Books'
  ];

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNamecontroller.text,
          description: descriptioncontroller.text,
          category: defaultCategory,
          price: double.parse(pricecontroller.text),
          quantity: double.parse(quantitycontroller.text),
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
  void dispose() {
    productNamecontroller.dispose();
    descriptioncontroller.dispose();
    pricecontroller.dispose();
    quantitycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: const Text(
              'Add Products',
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        }).toList(),
                        options:
                            CarouselOptions(viewportFraction: 1, height: 200),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [10, 4],
                          radius: const Radius.circular(10),
                          strokeCap: StrokeCap.round,
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Icon(
                                    Icons.folder_open_outlined,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Select Product Images',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade400),
                                  )
                                ]),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                    controller: productNamecontroller,
                    hintText: 'Product Name'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: descriptioncontroller,
                  hintText: 'Description',
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(controller: pricecontroller, hintText: 'Price'),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    controller: quantitycontroller, hintText: 'Quantity'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: defaultCategory,
                    onChanged: (String? nextVal) {
                      setState(() {
                        defaultCategory = nextVal!;
                      });
                    },
                    items: categories.map(
                      (String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      },
                    ).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    text: 'Sell',
                    onTap: () {
                      sellProduct();
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
