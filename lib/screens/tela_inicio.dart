import 'dart:js';

import 'package:flutter/material.dart';
import '../screens/tela_detalhes_produto.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('imagens/logo_oxesushi.png'),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(
                      key: const Key("1"),
                      productImage: "imagens/temaki_crocante.png",
                      productName: "Temaki Crock",
                      productDescription: "Empanado e Frito",
                      productPrice: 28.00,
                    ),
                  ),
                );
              },
              child: const Text('Cardápio'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Adicione a ação para o botão de criar conta aqui
              },
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
