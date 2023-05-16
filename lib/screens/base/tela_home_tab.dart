import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:oxesushi_v1/screens/base/componentes/tile_produto.dart';

import '../../componentes/custom_colors.dart';
import '../../config/mock_dados.dart' as mockDados;
import 'componentes/tile_categoria.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({Key? key}) : super(key: key);

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String categoriaSelecionada = 'Cru';

  GlobalKey<CartIconKey> globalkeyCartItems = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              const TextSpan(
                text: "Ôxe",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "Sushi",
                // ignore: unnecessary_const
                style: TextStyle(
                  color: CustomColors.colorAppVermelho,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 30,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: CustomColors.colorAppVermelho,
                label: const Text(
                  "2",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                child: AddToCartIcon(
                  key: globalkeyCartItems,
                  icon:const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: AddToCartAnimation(
        gkCart: globalkeyCartItems,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (AddToCartAnimation) {
          runAddToCartAnimation = AddToCartAnimation;
        },
        child: Column(
          children: [
            //barra pesquisar
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  hintText: "Pesquise aqui",
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 139, 136, 136),
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.colorAppVermelho,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            //Categorias
            Container(
              padding: const EdgeInsets.only(left: 25),
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoriaTile(
                    onPressed: () {
                      setState(() {
                        categoriaSelecionada = mockDados.categorias[index];
                      });
                    },
                    categoria: mockDados.categorias[index],
                    isSelected:
                        mockDados.categorias[index] == categoriaSelecionada,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: mockDados.categorias.length,
              ),
            ),
            //Grade de produtos
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemCount: mockDados.listaProdutos.length,
                itemBuilder: (_, index) {
                  return ProdutoTile(
                    produto: mockDados.listaProdutos[index],
                    cartAnimationMethod:itemSelectedCartAnimations
                  );
                },
              ),
            )
          ],
        ),
      ),
      //grade de pedidos
    );
  }
}
