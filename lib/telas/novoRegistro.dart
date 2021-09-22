import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/entidades/anexo.dart';
import 'package:myapp/util/util.dart';

class NovoRegisto extends StatefulWidget {
  const NovoRegisto({Key? key}) : super(key: key);

  @override
  _NovoRegistoState createState() => _NovoRegistoState();
}

class _NovoRegistoState extends State<NovoRegisto> {
  List<Anexo> anexos = [];
  bool loadingAnexo = false;

  editaDescricao() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 20,
            title: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              cursorColor: Colors.redAccent,
              decoration: InputDecoration(
                counter: Container(),
                hintText: "Descrição",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.redAccent)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
        backgroundColor: Colors.redAccent,
      ),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Novo Registro"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.black38,
            ],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 1100,
                child: Card(
                  elevation: 20,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                width: 100,
                                child: TextField(
                                  maxLength: 3,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  cursorColor: Colors.redAccent,
                                  decoration: InputDecoration(
                                    counter: Container(),
                                    hintText: "Número",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                width: 1000,
                                child: TextField(
                                  maxLength: 255,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  cursorColor: Colors.redAccent,
                                  decoration: InputDecoration(
                                    counter: Container(),
                                    hintText: "Título",
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                            color: Colors.redAccent)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Text(
                        "Descrição:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 30, 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          width: 1000,
                          child: TextField(
                            maxLines: 20,
                            maxLength: 1000,
                            keyboardType: TextInputType.multiline,
                            textAlignVertical: TextAlignVertical.bottom,
                            cursorColor: Colors.redAccent,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.redAccent)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Anexos:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      loadingAnexo
                          ? CircularProgressIndicator(
                              color: Colors.redAccent,
                            )
                          : TextButton.icon(
                              onPressed: () async {
                                FilePickerResult? result = await FilePicker
                                    .platform
                                    .pickFiles(onFileLoading: (value) {
                                  setState(() {
                                    loadingAnexo = true;
                                  });
                                });

                                if (result != null) {
                                  Anexo anexo = new Anexo();
                                  var arquivo = result.files.first;
                                  anexo.nome = arquivo.name;
                                  anexo.tipo = arquivo.extension!;
                                  anexo.filebyte = arquivo.bytes!;
                                  anexos.add(anexo);
                                }
                                setState(() {
                                  loadingAnexo = false;
                                });
                              },
                              style: TextButton.styleFrom(
                                  minimumSize: Size(180, 40),
                                  backgroundColor: Colors.redAccent,
                                  elevation: 20,
                                  textStyle: TextStyle(
                                    color: Colors.black,
                                  )),
                              label: Text(
                                "Importar Arquivo",
                                style: TextStyle(color: Colors.black),
                              ),
                              icon: Icon(
                                Icons.file_upload,
                                color: Colors.black,
                              ),
                            ),
                      Container(
                          height: 300,
                          width: 400,
                          child: anexos.isEmpty
                              ? Center(child: Text("Nenhum Anexo..."))
                              : ListView.builder(
                                  itemCount: anexos.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      trailing: Wrap(
                                        children: [
                                          Flexible(
                                            child: IconButton(
                                                onPressed: () {
                                                  editaDescricao();
                                                },
                                                icon: Icon(Icons.edit)),
                                          ),
                                          Flexible(
                                              child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                final snack = SnackBar(
                                                  elevation: 20,
                                                  backgroundColor:
                                                      Colors.redAccent,
                                                  content:
                                                      Text("Anexo Removido!"),
                                                  action: SnackBarAction(
                                                      label: "Desfazer",
                                                      onPressed: () {}),
                                                  duration:
                                                      Duration(seconds: 5),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .removeCurrentSnackBar();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snack);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.redAccent,
                                            ),
                                          ))
                                        ],
                                      ),
                                      title: Text(anexos[index].nome),
                                      subtitle: Text(anexos[index].descricao),
                                      leading: Util.verificaArquivo(
                                              anexos[index].tipo)
                                          ? CircleAvatar(
                                              backgroundImage: Image.memory(
                                                      anexos[index].filebyte)
                                                  .image,
                                            )
                                          : CircleAvatar(
                                              backgroundColor: Colors.redAccent,
                                              child: Icon(
                                                  Icons.attachment_rounded),
                                            ),
                                    );
                                  }))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
