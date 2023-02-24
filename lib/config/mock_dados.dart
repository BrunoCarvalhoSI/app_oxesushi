import '../models/ModelProduto.dart';

ModelProduto niguiriSalmao = ModelProduto(
  descricao: 'Arroz com fatia de Salmão',
  imageUrl: 'imagens/niguiriTransparente.png',
  nome: "Niguiri de Salmão",
  preco: 3.50,
  undMedida: "und",
);

ModelProduto niguiriBarrigaSalmao = ModelProduto(
  descricao: 'Arroz com fatia de Salmão Maçaricado',
  imageUrl: 'imagens/niguiriBarriga.png',
  nome: "Niguiri Barriga",
  preco: 3.00,
  undMedida: "und",
);
ModelProduto hotRool = ModelProduto(
  descricao: 'Salmão,Camarão,Kani,Arroz na massinha',
  imageUrl: 'imagens/hotRool.png',
  nome: "Hot Rool",
  preco: 2.00,
  undMedida: "und",
);
ModelProduto hotSalmao = ModelProduto(
  descricao: 'Salmão',
  imageUrl: 'imagens/hotCamarao.png',
  nome: "Hot Salmão",
  preco: 2.50,
  undMedida: "und",
);
ModelProduto hotKani = ModelProduto(
  descricao: 'Kani',
  imageUrl: 'imagens/hotCamarao.png',
  nome: "Hot Kani",
  preco: 2.00,
  undMedida: "und",
);
ModelProduto comboHotCamarao = ModelProduto(
  descricao: '18 unidades de Combo hot Camarão',
  imageUrl: 'imagens/hotSalmao.png',
  nome: "Hot Camarão",
  preco: 17.00,
  undMedida: "und(8)",
);
ModelProduto comboHot30Pecas = ModelProduto(
  descricao: '10 hot salmão, 10 hot rool, 10 hot kani',
  imageUrl: 'imagens/hot30.png',
  nome: "Hot 30 Peças",
  preco: 55.00,
  undMedida: "und(30)",
);
ModelProduto comboPastel = ModelProduto(
  descricao: 'Combo de Pastel',
  imageUrl: 'imagens/hotCamarao.png',
  nome: "Pastel 3 unidades",
  preco: 22.00,
  undMedida: "und(3)",
);
ModelProduto comboNutella = ModelProduto(
  descricao: 'Nutella',
  imageUrl: 'imagens/hotCamarao.png',
  nome: "Combo de Nutella",
  preco: 17.00,
  undMedida: "und",
);

List<ModelProduto> listaProdutos = [
  niguiriSalmao,
  niguiriBarrigaSalmao,
  hotRool,
  hotSalmao,
  hotKani,
  comboHotCamarao,
  comboHot30Pecas,
  comboPastel,
  comboNutella,
];

List<String> categorias = [
  'Cru',
  'Frito',
  'Combos',
  'Yakisoba',
  'Temaki',
  'Promoções',
];
