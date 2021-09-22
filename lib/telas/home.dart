import 'package:flutter/material.dart';
import 'package:myapp/tab/home_tab.dart';
import 'package:myapp/telas/novoRegistro.dart';
import 'package:myapp/widgets/drawer_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton.extended(
            elevation: 20,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => NovoRegisto(),));
            },
            label: Text("Novo Registro"),
            backgroundColor: Colors.redAccent,
            tooltip: "Cadastrar uma nova solucao",
          ),
          drawer: DrawerWidget(),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: Container(),
        ),
      ],
    );
  }
}
