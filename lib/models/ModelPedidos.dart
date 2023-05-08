// ignore: file_names
import '../models/ModelItemCarrinho.dart';

class ModelPedido {
  String id;
  DateTime dataCriacao;
  DateTime validadeQRCode;
  List<ModelItemCarrinho> itensPedido;
  String statusPedido;
  String statusPagamento;
  String copyAndPaste;
  double total;

  ModelPedido({
    this.id,
    this.dataCriacao,
    this.validadeQRCode,
    this.itensPedido,
    this.statusPedido,
    this.statusPagamento,
    this.copyAndPaste,
    this.total,
  });
}
