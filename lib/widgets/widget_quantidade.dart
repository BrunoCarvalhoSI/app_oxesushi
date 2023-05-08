import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../componentes/custom_colors.dart';

class WidgetQuantidade extends StatelessWidget {
  final int quantidade;
  final String suffixText;
  final Function(int quantity) result;
  final bool isRemovable;

  WidgetQuantidade({
    Key key,
    this.quantidade,
    this.suffixText,
    this.result,
    this.isRemovable = false,
    this.quantityController,
  }) : super(key: key) {
    // Instanciando o controlador do campo de texto com o valor inicial
    quantityController = TextEditingController(text: quantidade.toString());

    // Adicionando um listener que é chamando sempre que o campo de texto é alterado
    // A ideia é verifiar se o campo está vazio ou igual a zero e se sim, trocar para "1"
    /*    quantityController.addListener(() {
      final text = quantityController.text;
      if (text.isEmpty || text == '0') {
        quantityController.text = '1';
      }
    }); */
  }

  // Controlador que irá gerenciar o valor do campo de texto
  TextEditingController quantityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _WidgetQuantidade(
            icon: !isRemovable || quantidade > 1
                ? Icons.remove
                : Icons.delete_forever,
            color: !isRemovable || quantidade > 1 ? Colors.grey : Colors.red,
            onPressed: () {
              // Comando para remover o teclado
              FocusScope.of(context).unfocus();
              int qtdAtualizada = int.parse(quantityController.text);
              if (qtdAtualizada == 1 && !isRemovable) return;
              int resultCount = qtdAtualizada - 1;
              result(resultCount);
            },
          ),
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              // Campo de texto
              child: TextFormField(
                controller: quantityController,
                // Para que o teclado numérico seja apresentado
                keyboardType: TextInputType.number,
                // Para permitir apenas digitos numéricos
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                // Quando modificado o valor do campo de texto recebemos este novo valor aqui
                // Convertemos o valor porque o campo trabalha com String e o nosso Widget de quantidade com int
                /* onChanged: (value) {
                  result(int.parse(value));
                  quantityController.text = value;
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // Move o cursor para o final do campo de texto
                    quantityController.selection = TextSelection.fromPosition(
                        TextPosition(offset: value.length));
                  });
                }, */
                onTap: () {
                  result(int.parse(quantityController.text));
                },
                decoration: const InputDecoration(
                  // Retirando a borda
                  border: InputBorder.none,
                  // Para que o campo seja denso e sua altura seja reduzida
                  isDense: true,
                  // Para remover todo o espaçamento interno padrão do campo
                  contentPadding: EdgeInsets.zero,
                  // Adicionando o texto de sufixo a unidade de medida
                  // suffixText: suffixText,
                ),
              ),
            ),
          ),
          //Adicionando quantidade na widget
          _WidgetQuantidade(
            icon: Icons.add,
            color: CustomColors.colorAppVerde,
            onPressed: () {
              // Comando para remover o teclado
              FocusScope.of(context).unfocus();
              int resultCount = int.parse(quantityController.text) + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _WidgetQuantidade extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _WidgetQuantidade({
    Key key,
    this.color,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
