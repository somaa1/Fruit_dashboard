import 'package:flutter/material.dart';
import 'package:fruit_hub_dash/core/widget/custom_button.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/views/add_product_view.dart';

import '../../../../orders/presentation/views/orders_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AddProduct.routeName);
            },
            text: 'AddData'),
        SizedBox(
          height: 10,
        ),
        CustomButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, OrdersView.routeName);
            },
            text: 'OrdersView')
      ]),
    );
  }
}
