import 'package:flutter/material.dart';

class ItemList {
  final String route;
  final String text;
  final IconData icon;
  final String imageRoute;

  ItemList({
    required this.icon,
    required this.route,
    required this.text,
    required this.imageRoute,
  });
}
