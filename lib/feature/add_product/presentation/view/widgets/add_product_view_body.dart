import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frut_hub_dashboard/core/utils/utils.dart';
import 'package:frut_hub_dashboard/core/widgets/custom_text_filed.dart';
import 'package:frut_hub_dashboard/feature/add_product/domain/entities/add_product_input_entity.dart';
import 'package:frut_hub_dashboard/feature/add_product/presentation/view/widgets/is_organic.dart';

import '../../view_model/add_product_cubit.dart';
import 'image_picker_section.dart';
import 'is_featured.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();
  late String name, code, description;
  late num price, expireationMonth, numOfCalories, stockQuantity;

  bool isFeatured = false;
  bool isOrganic = false;

  String? selectedCategory;
  final List<String> categories = ['Fruits', 'Vegetables', 'Snacks', 'Drinks'];

  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1100;

    final double padding = isDesktop ? 50 : 20;
    final double fieldWidth = isDesktop ? 400 : double.infinity;
    final double spacing = 20;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  10.ph,
                  ImagePickerSection(
                    selectedImage: selectedImage,
                    onImageSelected: (image) {
                      setState(() {
                        selectedImage = image;
                      });
                    },
                  ),
                  15.ph,
                  IsFeatured(
                    onChanged: (isFeatured) {
                      this.isFeatured = isFeatured;
                    },
                  ),
                  15.ph,
                  IsOrganic(
                    onChanged: (isOrganic) {
                      this.isOrganic = isOrganic;
                    },
                  ),
                  30.ph,
                  Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    children: [
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextFormFiled(
                          onSaved: (value) {
                            name = value ?? '';
                          },
                          hintText: "Product Name",
                        ),
                      ),
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextFormFiled(
                          onSaved: (value) {
                            price = num.tryParse(value ?? '') ?? 0;
                          },
                          hintText: "Product Price",
                        ),
                      ),
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextFormFiled(
                          onSaved: (value) {
                            expireationMonth = num.tryParse(value ?? '') ?? 0;
                          },
                          hintText: "expiry Month",
                        ),
                      ),
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextFormFiled(
                          onSaved: (value) {
                            numOfCalories = num.tryParse(value ?? '') ?? 0;
                          },
                          hintText: "num Of Calories",
                        ),
                      ),
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextFormFiled(
                          onSaved: (value) {
                            stockQuantity = num.tryParse(value ?? '') ?? 0;
                          },
                          hintText: "stock Quantity",
                        ),
                      ),
                      SizedBox(
                        width: fieldWidth,
                        child: CustomTextFormFiled(
                          onSaved: (value) {
                            code = value?.toLowerCase() ?? '';
                          },
                          hintText: "Product Code",
                        ),
                      ),
                      SizedBox(
                        width: fieldWidth,
                        child: DropdownButtonFormField<String>(
                          value: selectedCategory,
                          decoration: InputDecoration(
                            hintText: "Select Category",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          items: categories
                              .map(
                                (cat) => DropdownMenuItem(
                                  value: cat,
                                  child: Text(cat),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() => selectedCategory = value);
                          },
                        ),
                      ),
                    ],
                  ),
                  20.ph,
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 150,
                    ),
                    child: CustomTextFormFiled(
                      onSaved: (value) {
                        description = value ?? '';
                      },
                      hintText: "Product Description",
                      maxLines: null,
                    ),
                  ),
                  30.ph,
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5DB075),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.check_circle_outline,
                        color: Colors.white),
                    label: const Text(
                      "Add Product",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (selectedImage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select an image.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          AddProductInputEntity inputEntity =
                              AddProductInputEntity(
                                reviews: [],
                            name: name,
                            code: code,
                            description: description,
                            price: price,
                            category: selectedCategory ?? 'Uncategorized',
                            imageUrl: selectedImage!.path,
                            image: selectedImage!,
                            expiryMonths: expireationMonth.toInt(),
                            numOfCalories: numOfCalories.toInt(),
                            stockQuantity: stockQuantity.toInt(),
                            isFeatured: isFeatured,
                            isOrganic: isOrganic,
                          );
                          context
                              .read<AddProductCubit>()
                              .addProduct(inputEntity);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product added successfully!'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
