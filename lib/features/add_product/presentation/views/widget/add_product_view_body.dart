import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash/core/widget/custom_button.dart';
import 'package:fruit_hub_dash/core/widget/custom_text_field.dart';
import 'package:fruit_hub_dash/features/add_product/domin/entities/product_entity.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/manager/cuibit/add_product_cubit.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/views/widget/custom_checkbox.dart';

import 'image_filed.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, decription;

  late num price, expirationMonths, nuumberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
            key: _formkey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 16),
                CustomTextFormField(
                    onSaved: (value) {
                      name = value!;
                    },
                    hintText: 'Product Name',
                    textInputType: TextInputType.text),
                const SizedBox(height: 16),
                CustomTextFormField(
                    onSaved: (value) {
                      price = num.parse(value!);
                    },
                    hintText: 'Product Price',
                    textInputType: TextInputType.number),
                const SizedBox(height: 16),
                CustomTextFormField(
                    onSaved: (value) {
                      code = value!.toLowerCase();
                    },
                    hintText: 'Product Code',
                    textInputType: TextInputType.number),
                const SizedBox(height: 16),
                CustomTextFormField(
                    onSaved: (value) {
                      decription = value!;
                    },
                    hintText: 'Product Description',
                    textInputType: TextInputType.text,
                    maxLines: 5),
                const SizedBox(height: 16),
                //*****
                CustomTextFormField(
                  onSaved: (value) {
                    expirationMonths = num.parse(value!);
                    ;
                  },
                  hintText: 'Expiration Months',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    nuumberOfCalories = num.parse(value!);
                  },
                  hintText: 'Nuumber Of Calories',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    unitAmount = num.parse(value!);
                  },
                  hintText: 'Unit Amount',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ChecBoxWidget(
                  onChanged: (value) {
                    isOrganic = value;
                  },
                  text: 'is Product Organic?',
                ),
                const SizedBox(height: 16),
                ChecBoxWidget(
                  onChanged: (value) {
                    isFeatured = value;
                  },
                  text: 'is Featured Item?',
                ),
                const SizedBox(height: 30),
                ImageField(
                  onFileChanged: ( image) {
                    this.image=image;
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                CustomButton(
                  onPressed: () {
                    if (image != null) {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        String productId = FirebaseFirestore.instance.collection('products').doc().id;

                        ProductEntity input = ProductEntity(
                            name: name,
                            code: code,
                            price: price,
                            description: decription,
                            image: image!,
                            isFeatured: isFeatured,
                            expirationsMonths: expirationMonths.toInt(),
                            numberOfCalories: nuumberOfCalories.toInt(),
                            unitAmount: unitAmount.toInt(),
                            isOrganic: isOrganic,
                            reviews: [], id:productId );
                        context.read<AddProductCubit>().addProduct(input);
                      }
                    } else {
                      showError(context);
                    }
                  },
                  text: 'Add Product',
                )
              ],
            )),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select an image'),
      ),
    );
  }
}
