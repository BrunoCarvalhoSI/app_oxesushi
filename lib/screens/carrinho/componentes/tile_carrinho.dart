import 'package:flutter/material.dart';
import 'package:oxesushi_v1/componentes/custom_colors.dart';
import 'package:oxesushi_v1/models/ModelItemCarrinho.dart';
import 'package:oxesushi_v1/services/utils_services.dart';
import 'package:oxesushi_v1/widgets/widget_quantidade.dart';

class CarrinhoTile extends StatefulWidget {
  final ModelItemCarrinho itemCarrinho;

  final Function(ModelItemCarrinho) remove;

  const CarrinhoTile({
    Key key,
    this.itemCarrinho,
    this.remove,
  }) : super(key: key);

  @override
  State<CarrinhoTile> createState() => _CarrinhoTileState();
}

class _CarrinhoTileState extends State<CarrinhoTile> {
  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        //Imagem
        leading: Image.asset(
          widget.itemCarrinho.item.imageUrl,
          height: 60,
          width: 60,
        ),
        //Titulo
        title: Text(
          widget.itemCarrinho.item.nome,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        //Total
        subtitle: Text(
          utilsServices.priceToCurrency(widget.itemCarrinho.precoTotal()),
          style: TextStyle(
            color: CustomColors.colorAppVerde,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Quantidade
        trailing: WidgetQuantidade(
          suffixText: widget.itemCarrinho.item.undMedida,
          quantidade: widget.itemCarrinho.quantidade,
          result: (qtd) {
            setState(() { 
              widget.itemCarrinho.quantidade = qtd;
              if (qtd == 0) {
                // Remover item do carrinho
                widget.remove(widget.itemCarrinho);
              }
            });
          },
          isRemovable: true,
        ),
      ),
    );
  }
}
