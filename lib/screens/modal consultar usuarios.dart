import 'package:flutter/material.dart';

ModalConsultarUsuarios(BuildContext context) {
  dynamic fetchUsuarios;
  ConsultarUsuarios().then((consult) {
    fetchUsuarios = consultarUsuarios;

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(padding: EdgeInsets.all(8), child: Icon(Icons.event),),
              ],

            ),
          );
        });
  });
}
