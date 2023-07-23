import 'package:flutter/material.dart';

class EntertaimentItem {
  final String imageUrl;
  final String title;
  final String subtitle;
  final IconButton trailing;

  EntertaimentItem({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });
}
