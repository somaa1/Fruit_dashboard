import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dash/core/helper_functions/build_error_bar.dart';
import 'package:fruit_hub_dash/core/widget/customprogresshud.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/manager/cuibit/add_product_cubit.dart';

import '../../../../../core/helper_functions/build_success_bar.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildSuccessBar(context, " products Add successfully");
        }
        if (state is AddProductFailure) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is AddProductLoading, child: AddProductViewBody());
      },
    );
  }
}
