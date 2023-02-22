import 'ModelProduto.dart';

class Carrinho {
  final String id;
  final List<ModelProduto> produtos;
  final double precoTotal;

  Carrinho({this.id, this.produtos, this.precoTotal});
}
