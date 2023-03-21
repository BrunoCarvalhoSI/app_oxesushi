import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';

class StatusPedidoWidget extends StatelessWidget {
  final String status;
  final bool estaVencido;

  final Map<String, int> todosStatus = <String, int>{
    'Pedido em analise': 0,
    'Pedido recusado': 1,
    'Pedido aceito': 2,
    'Pix vencido': 3,
    'Pagamento efetuado': 4,
    'Em produção': 5,
    'Enviado': 6,
    'Entregue': 7,
    'Pedido cancelado': -1,
    'Pagamento devolvido': -2,
  };

  int get statusAtual => todosStatus[status];

  StatusPedidoWidget({
    Key key,
    this.estaVencido,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDoPedido(isActive: true, titulo: 'Pedido em analise'),
        if (statusAtual == 1) ...[
          const _CustomDivisorStatus(),
          const _StatusDoPedido(
            isActive: true,
            titulo: "Pedido recusado",
            backgroundcolor: Colors.red,
          ),
        ] else if (estaVencido) ...[
          const _CustomDivisorStatus(),
          const _StatusDoPedido(
            isActive: true,
            titulo: "Pix vencido",
            backgroundcolor: Colors.orange,
          ),
        ] else ...[
          const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusAtual >= 2,
            titulo: "Pedido aceito",
          ),
          const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusAtual >= 4,
            titulo: "Pagamento efetuado",
          ),
          const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusAtual >= 5,
            titulo: "Em produção",
          ),
          const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusAtual >= 6,
            titulo: "Enviado",
          ),
          const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusAtual >= 7,
            titulo: "Entregue",
          ),
          const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusAtual == -1,
            titulo: "Pedido Cancelado",
          ),
          const _CustomDivisorStatus(),
          _StatusDoPedido(
            isActive: statusAtual == -2,
            titulo: "Pagamento devolvido",
            backgroundcolor: Colors.blue,
          ),
        ]
      ],
    );
  }
}

class _StatusDoPedido extends StatelessWidget {
  final bool isActive;
  final String titulo;
  final Color backgroundcolor;
  const _StatusDoPedido({
    Key key,
    this.isActive,
    this.titulo,
    this.backgroundcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DOT bolinha com os status
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.colorAppVerde,
            ),
            color: isActive
                ? backgroundcolor ?? CustomColors.colorAppVerde
                : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        //Texto do status
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        )
      ],
    );
  }
}

class _CustomDivisorStatus extends StatelessWidget {
  const _CustomDivisorStatus({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 8,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}
