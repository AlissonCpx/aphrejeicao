class Usuario {
  String _idUser = "";
  String _nome = "";
  String _login = "";
  String _senha = "";
  bool _admin = false;


  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.idUser,
      "nome": this.nome,
      "login": this.login,
      "senha": this.senha,
      "admin": this.admin
    };

    return map;
  }

  bool get admin => _admin;

  set admin(bool value) {
    _admin = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get login => _login;

  set login(String value) {
    _login = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get idUser => _idUser;

  set idUser(String value) {
    _idUser = value;
  }


}
