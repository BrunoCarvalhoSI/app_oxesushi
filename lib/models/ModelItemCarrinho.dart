import 'ModelProduto.dart';

class ModelItemCarrinho {
  ModelProduto item;
  int quantidade;

  ModelItemCarrinho({
    this.item,
    this.quantidade,
  });

  double precoTotal() => item.preco * quantidade;
}
