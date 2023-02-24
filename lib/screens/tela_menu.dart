import '../screens/tela_detalhes_produto.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List products = ['Hot Salmão', 'Hot Camarão', 'Hot Rool'];
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cardápio'),
          // ignore: prefer_const_constructors
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Frito'),
              Tab(text: 'Cru'),
              Tab(text: 'Yakisoba'),
              Tab(text: 'Temaki')
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DetalhesDoProduto(key: const Key("123")),
                      ),
                    );
                  },
                  child: Center(child: Text(products[index])),
                );
              },
            ),
            const Center(child: Text('Hots')),
            const Center(child: Text('Crus')),
          ],
        ),
      ),
    );
  }
}
