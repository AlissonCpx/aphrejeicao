import 'dart:typed_data';

class Anexo {
  String _nome = "";
  String _tipo = "";
  String _descricao = "";
  Uint8List _filebyte = new Uint8List(8);

  Anexo();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "tipo": this.tipo,
      "descricao": this.descricao,
      "filebyte": this.filebyte,
    };

    return map;
  }

  Uint8List get filebyte => _filebyte;

  set filebyte(Uint8List value) {
    _filebyte = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get descricao => _descricao;

  set descricao(String value) {
    _descricao = value;
  }
}
