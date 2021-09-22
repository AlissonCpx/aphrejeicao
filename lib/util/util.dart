import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/entidades/usuario.dart';

class Util {
  static bool verificaArquivo(String tipo) {
    if (tipo == "jpg") return true;
    if (tipo == "png") return true;
    if (tipo == "jpeg") return true;
    return false;
  }

  static Future<Usuario> login(String login, String senha) async {
    CollectionReference users =
        await FirebaseFirestore.instance.collection('usuarios');
    List<DocumentSnapshot> userFb = (await users
            .where("login", isEqualTo: login)
            .where("senha", isEqualTo: senha)
            .get())
        .docs;
    Usuario user = new Usuario();
    if (userFb.isNotEmpty) {
      user.nome = userFb[0]["nome"];
      user.login = userFb[0]["login"];
      user.senha = userFb[0]["senha"];
      user.admin = userFb[0]["admin"];
    }
    return user;
  }
}
