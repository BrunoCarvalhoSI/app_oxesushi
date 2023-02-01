import '../models/Produto.dart';

class Pedido {
  final String id;
  final List<Produto> produtos;
  final double precoTotalPedido;
  final DateTime dataPedido;

  Pedido({this.id, this.produtos, this.precoTotalPedido, this.dataPedido});
}
