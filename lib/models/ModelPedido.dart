import 'ModelProduto.dart';

class Pedido {
  final String id;
  final List<ModelProduto> produtos;
  final double precoTotalPedido;
  final DateTime dataPedido;

  Pedido({this.id, this.produtos, this.precoTotalPedido, this.dataPedido});
}
