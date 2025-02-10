import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dash/core/repos/product_repo/products_repo.dart';
import 'package:fruit_hub_dash/core/service/get_it_service.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/manager/cuibit/add_product_cubit.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/views/widget/add_product_view_body.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/views/widget/add_product_view_body_bloc_builder.dart';

import '../../../../core/widget/build_app_bar.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  static const routeName = "AddProduct";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: BlocProvider(
        create: (context) =>
            AddProductCubit(
                getIt.get<ImageRepo>(),
                getIt.get<ProductsRepo>()),
        child: AddProductViewBodyBlocBuilder(),
      ),
    );
  }
}
