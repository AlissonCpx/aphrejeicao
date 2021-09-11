import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget listCard() {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 600,
              child: Card(
                  elevation: 30,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: Container(
                            height: 20,
                            child: Text(
                              "Titulo da rejeiçao",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 2, 10),
                        child: Container(
                          height: 100,
                          child: Text(
                            "Um breve resumo sobre a rejeicao e suas possiveis solucoes e etssadsdasdasdsadadasdasdadiasdoiuoiuasouiasoiudaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇaoiudaoiuasoiuasoiuAÇasoiudasoiudaoiusoiudaiusdoiuasdouiasoiuaosiudaoiusdoaisudc LONGO MTLONGOOGNOOFNGOFNGOFDNGONODFNGONDFONGONFONG",
                            overflow: TextOverflow.ellipsis,
                            //softWrap: true,
                            maxLines: 6,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                        child: Container(
                          height: 30,
                          child: Row(
                            children: [
                              Flexible(
                                  flex: 2,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: Icon(
                                          Icons.person,
                                          color: Colors.blueAccent,
                                        )),
                                        Flexible(
                                            fit: FlexFit.loose,
                                            child: Text(
                                              "Alisson Andrade",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                      ],
                                    ),
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: Icon(
                                          Icons.chat,
                                          color: Colors.blueAccent,
                                        )),
                                        Flexible(
                                            child: Text(
                                          "2",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                      ],
                                    ),
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                            child: Icon(
                                          Icons.assignment_turned_in_outlined,
                                          color: Colors.blueAccent,
                                        )),
                                        Flexible(
                                            child: Text(
                                          "4",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      );
    }

    return Container(
        child: SingleChildScrollView(
      controller: ScrollController(keepScrollOffset: false),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("APH Rejeicoes"),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  width: 350,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    cursorColor: Colors.redAccent,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                      hintText: "Pesquise Aqui!",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20),
                child:
                    IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 750,
            child: Card(
              child: Column(
                children: [
                  new AppBar(
                    leading: Container(),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    centerTitle: false,
                    title: Text(
                      "Rejeicoes Comuns",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                  listCard(),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
