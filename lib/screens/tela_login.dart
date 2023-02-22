// ignore: implementation_imports
import 'package:flutter/material.dart';
import 'base/tela_base.dart';
import '../screens/tela_cadastro_usuario.dart';
import '../componentes/custom_colors.dart';
import '../componentes/custom_text_field.dart';
import 'tela_detalhes_produto.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              //CONTAINER SUPERIOR
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    //IMAGEM OXE SUSHI
                    image: DecorationImage(
                      image: AssetImage('imagens/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              //BOTAO CARDAPIO
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.colorAppVermelho,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: CustomColors.colorAppVermelho,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ProductDetailScreen(
                            key: const Key("123"),
                            productDescription: 'temaki',
                            productImage: ('imagens/temaki_crocante.png'),
                            productPrice: 2500,
                            productName: 'dsa',
                            productQuantity: 2,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.restaurant_menu,
                      size: 35,
                    ),
                    label: const Text(
                      "CARDÁPIO",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              //FORMULARIO
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                //DECORACAO DO CONTAINER INFERIOR
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //EMAIL
                    const CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                    ),
                    //SENHA
                    const CustomTextField(
                      icon: Icons.lock,
                      label: "Senha",
                      isSecret: true,
                    ),
                    //BOTAO ENTRAR
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (c) {
                                return const TelaBase();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Entrar",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    //BOTAO ESQUECI A SENHA
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Esqueci a Senha",
                          style: TextStyle(
                            color: CustomColors.colorAppVermelho,
                          ),
                        ),
                      ),
                    ),
                    //DIVISOR OU
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.black.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Text("Ou"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //BOTAO CRIAR CONTA
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            side: BorderSide(
                              width: 2,
                              color: CustomColors.colorAppTema,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    TelaCadastroUsuario(),
                              ),
                            );
                          },
                          child: const Text(
                            "Criar Conta",
                            style: TextStyle(fontSize: 18),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
