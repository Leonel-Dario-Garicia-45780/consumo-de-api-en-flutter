// import 'package:consumo_de_api/controlador/consultarUsuarios.dart';
import 'package:consumo_de_api/services/user_service.dart';
import 'package:flutter/material.dart';

ModalEventos(BuildContext context) {
/*   final consultaUsuarios = consultarUsuarios(); */
  final consultaUsuarios = consultarUsuarios();
  print(consultaUsuarios);

  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.event),
              )
            ],
            backgroundColor: Colors.red[100],
            title: Text("Informes"),
          ),
          body: Center(
            child: Text("Hola"),
          ),
        );
      });
}
