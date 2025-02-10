import 'package:flutter/material.dart';

import 'widget/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const routeName = "dashboard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashboardViewBody(),
    );
  }
}
