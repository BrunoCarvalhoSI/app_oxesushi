import 'package:flutter/material.dart';
import '../componentes/custom_colors.dart';

class WidgetQuantidade extends StatelessWidget {
  final int quantidade;
  final String suffixText;
  final Function(int qtd) result;
  final bool isRemovable;

  const WidgetQuantidade({
    Key key,
    this.quantidade,
    this.suffixText,
    this.result,
    this.isRemovable = false,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          _WidgetQuantidade(
            icon: !isRemovable || quantidade > 1
                ? Icons.remove
                : Icons.delete_forever,
            color: !isRemovable || quantidade > 1 ? Colors.grey : Colors.red,
            onPressed: () {
              if (quantidade == 1 && !isRemovable) return;
              int resultCount = quantidade - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(
              '$quantidade$suffixText',
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
