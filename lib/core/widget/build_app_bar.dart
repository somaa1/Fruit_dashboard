import 'package:flutter/material.dart';

AppBar buildAppBar(String text) => AppBar(
      centerTitle: true,
      title: Text(text),
      leading: Icon(Icons.arrow_back),
    );
