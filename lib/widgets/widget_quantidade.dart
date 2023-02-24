import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';

class WidgetQuantidade extends StatelessWidget {
  final int quantidade;
  final String sufixText;
  final Function(int qtd) result;

  const WidgetQuantidade({
    Key key,
    this.quantidade,
    this.sufixText,
    this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          _WidgetQuantidade(
            icon: Icons.remove,
            color: Colors.grey,
            onPressed: () {
              if (quantidade == 1) return;

              int resultCount = quantidade - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$quantidade$sufixText',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _WidgetQuantidade(
            icon: Icons.add,
            color: CustomColors.colorAppVerde,
            onPressed: () {
              int resultCount = quantidade + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _WidgetQuantidade extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _WidgetQuantidade({
    Key key,
    this.color,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
