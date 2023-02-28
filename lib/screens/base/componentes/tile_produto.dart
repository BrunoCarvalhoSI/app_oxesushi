import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';
import 'package:oxesushi_v1/models/ModelProduto.dart';
import 'package:oxesushi_v1/screens/tela_detalhes_produto.dart';
import 'package:oxesushi_v1/services/utils_services.dart';

class ProdutoTile extends StatelessWidget {
  final ModelProduto produto;

  ProdutoTile({
    Key key,
    this.produto,
  }) : super(key: key);

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (c) {
                return DetalhesDoProduto(
                  produto: produto,
                );
              },
            ));
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Imagem
                  Expanded(
                    child: Hero(
                      tag: produto.imageUrl,
                      child: Image.asset(produto.imageUrl),
                    ),
                  ),
                  //Nome
                  Text(
                    produto.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //Preço - unidade de medida
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(produto.preco),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.colorAppVerde,
                        ),
                      ),
                      Text(
                        '/${produto.undMedida}',
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        //Botao de Adicionar ao Carrinho
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.colorAppVerde,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        )
      ],
    );
  }
}
