import 'package:flutter/material.dart';
import 'package:myapp/entidades/usuario.dart';
import 'package:myapp/telas/teste.dart';
import 'package:myapp/util/util.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final loginController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
                width: 500,
                height: 500,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      GradientText(
                        'APH',
                        style: TextStyle(
                            fontSize: 70.0,
                            fontWeight: FontWeight.bold
                        ),
                        colors: [
                          Colors.red,
                          Colors.redAccent,
                        ],
                      ),

                      GradientText(
                        'Rejeições',
                        style: TextStyle(
                            fontSize: 18.0,
                        ),
                        colors: [
                          Colors.redAccent,
                          Colors.red,
                        ],
                      ),


                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: TextField(
                          controller: loginController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(hintText: "Login"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                        child: TextField(
                          controller: senhaController,
                          textAlign: TextAlign.center,

                          decoration: InputDecoration(
                            hintText: "Senha",
                            alignLabelWithHint: true,
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                width: 150,
                                height: 30,
                                child: PhysicalModel(
                                  color: Colors.transparent,
                                  shadowColor: Colors.black,
                                  elevation: 8.0,
                                  child: RaisedButton(
                                    child: Text(
                                      'Entrar',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                    textColor: Colors.white,
                                    color: Colors.redAccent,
                                    onPressed: () async {
                                      Usuario user = await Util.login(loginController.text, senhaController.text);
                                      print('foi' + user.login);

                                    },
                                  ),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  elevation: 30,
                ))
          ],
        ),
      ),
    );
  }
}
