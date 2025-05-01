import 'package:flutter/material.dart';

class SpendingCategory {
  final String name;
  final String time;
  final String amount;
  final IconData icon;
  final Color iconBgColor;

  SpendingCategory({
    required this.name,
    required this.time,
    required this.amount,
    required this.icon,
    required this.iconBgColor,
  });
}