import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';
import 'package:oxesushi_v1/screens/carrinho/componentes/tile_carrinho.dart';
import 'package:oxesushi_v1/services/utils_services.dart';
import 'package:oxesushi_v1/config/mock_dados.dart' as mock;
import '../../models/ModelItemCarrinho.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({Key key}) : super(key: key);

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  final UtilsServices utilsServices = UtilsServices();

  void removerItemCarrinho(ModelItemCarrinho itemCarrinho) {
    setState(() {
      mock.itensCarrinho.remove(itemCarrinho);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mock.itensCarrinho.length,
              itemBuilder: (_, index) {
                return CarrinhoTile(
                  itemCarrinho: mock.itensCarrinho[index],
                  remove: removerItemCarrinho,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total geral",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(50.0),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.colorAppVerde,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.colorAppVerde,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Concluir pedido",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
