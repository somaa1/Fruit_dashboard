import 'package:flutter/material.dart';
import 'package:fruit_hub_dash/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruit_hub_dash/features/dashboard/presentation/views/dashboard_view.dart';

import '../../features/orders/presentation/views/orders_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (BuildContext context) => DashboardView());
    case AddProduct.routeName:
      return MaterialPageRoute(builder: (BuildContext context) => AddProduct());
    case OrdersView.routeName:
      return MaterialPageRoute(builder: (BuildContext context) => OrdersView());

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) =>
              Scaffold(body: Center(child: Text('Page not found'))));
  }
}
