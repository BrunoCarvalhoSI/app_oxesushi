import 'package:flutter/material.dart';
import '../componentes/custom_colors.dart';

Widget _buildBadgeWidget(int itemCount) {
  return Badge(
    backgroundColor: CustomColors.colorAppVermelho,
    label: const Text(
      "1",
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    ),
    child: const Icon(
      Icons.shopping_cart,
    ),
  );
}
