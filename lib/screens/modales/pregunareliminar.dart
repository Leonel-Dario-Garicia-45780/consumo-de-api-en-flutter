import 'package:flutter/material.dart';

void showEliminarUsuario(
    BuildContext context, String userId, VoidCallback oneDeleteConfirmed) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar eliminación"),
          content: Text("¿Está seguro de eliminar el usuario ?"),
          actions: [
            TextButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            TextButton(
                child: Text("Confirmar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  oneDeleteConfirmed();
                }),
          ],
        );

        //! 🤷
        // return AlertDialog(
        //   title: Text("Confirmar eliminación"),
        //   content: Text("¿Está seguro de eliminar el usuario con ID $userId?"),
        //   actions: <Widget>[
        //     FlatButton(
        //       child: Text("Cancelar"),
        //       onPressed: () => Navigator.pop(context),
        //     ),
        //     FlatButton(
        //       child: Text("Confirmar"),
        //       onPressed: () => oneDeleteConfirmed(),
        //     ),
        //   ],
        // );
      });
}
