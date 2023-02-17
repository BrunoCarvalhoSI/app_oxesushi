import 'package:flutter/material.dart';
import 'package:oxesushi_v1/config/custom_colors.dart';
import 'package:oxesushi_v1/src/componentes/custom_text_field.dart';

import '../config/util.dart';

class TelaCadastroUsuario extends StatelessWidget {
  const TelaCadastroUsuario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.colorAppTema,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      const Expanded(
                        child: Center(
                          child: Text(
                            "Cadastro",
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                      //FORMULARIO
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 40),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(45),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const CustomTextField(
                              icon: Icons.email,
                              label: 'Email',
                            ),
                            const CustomTextField(
                              icon: Icons.lock,
                              label: 'Senha',
                              isSecret: true,
                            ),
                            const CustomTextField(
                              icon: Icons.person,
                              label: 'Nome',
                            ),
                            CustomTextField(
                              icon: Icons.phone,
                              label: 'Telefone',
                              inputFormatters: [phoneFormatter],
                            ),
                            CustomTextField(
                              icon: Icons.file_copy,
                              label: 'CPF',
                              inputFormatters: [cpfFormatter],
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Cadastrar",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: SafeArea(
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
