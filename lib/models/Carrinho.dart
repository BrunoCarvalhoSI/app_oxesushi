import '../models/Produto.dart';

class Carrinho {
  final String id;
  final List<Produto> produtos;
  final double precoTotal;

  Carrinho({this.id, this.produtos, this.precoTotal});
}
