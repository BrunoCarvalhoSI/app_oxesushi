import 'package:flutter/material.dart';

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
                // Adicione a ação para o botão de login aqui
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                // Adicione a ação para o botão de criar conta aqui
              },
              child: const Text('Criar Conta'),
            ),
          ],
        ),
      ),
    );
  }
}
