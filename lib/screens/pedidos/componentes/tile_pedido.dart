import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';
import 'package:oxesushi_v1/models/ModelPedidos.dart';
import 'package:oxesushi_v1/services/utils_services.dart';

class PedidoTile extends StatelessWidget {
  final ModelPedido pedido;

  PedidoTile({
    Key key,
    this.pedido,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido:${pedido.id}'),
              Text(
                utilsServices.formatDateTime(pedido.dataCriacao),
                style: TextStyle(
                  fontSize: 12,
                  color: CustomColors.colorAppVermelho,
                ),
              ),
            ],
          ),
          children: [],
        ),
      ),
    );
  }
}
