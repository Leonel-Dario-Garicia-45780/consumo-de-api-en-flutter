import 'package:consumo_de_api/screens/modales/pregunareliminar.dart';
import 'package:consumo_de_api/screens/modales/preguntaractualizar.dart';
import 'package:consumo_de_api/services/actualizar_usuario.dart';
import 'package:consumo_de_api/services/eliminar_usuario.dart';
import 'package:flutter/material.dart';
import 'package:consumo_de_api/services/user_service.dart';

ModalConsultarUsuarios(BuildContext context) async {
  try {
    final fetchUsers =
        await consultarUsuarios(); // Asegúrate de que consultarUsuarios() devuelva una lista de usuarios

    if (fetchUsers.isEmpty) {
      // Manejar el caso cuando no hay usuarios
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red[100],
                title: Text('Usuarios'),
              ),
              body: Center(
                child: Text('No se encontraron usuarios'),
              ),
            );
          });
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Scaffold(
                appBar: AppBar(
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.event),
                    )
                  ],
                  backgroundColor: Colors.red[100],
                  title: Text('Usuarios'),
                ),
                body: ListView.builder(
                  itemCount: fetchUsers.length,
                  itemBuilder: (context, index) {
                    //! muestra la informacion dentro del builder
                    return ListTile(
                      title: Text(fetchUsers[index].nombre),
                      subtitle: Text('Usuario ${index + 1}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.update, color: Colors.purple[300]),
                            onPressed: () {
                              showActualizarUsuario(
                                context,
                                fetchUsers[index],
                                (updatedUser) {
                                  actualizarUsuario(
                                    updatedUser.id, // Usar el ID original
                                    updatedUser.cedula, // No actualizar la cédula
                                    updatedUser.nombre,
                                    updatedUser.telefono,
                                    updatedUser.direccion,
                                    updatedUser.email,
                                    updatedUser.contrasena,
                                  ).then((_) {
                                    print(updatedUser.id);
                                    setState(() {
                                      // Actualiza el usuario en la lista
                                      fetchUsers[index] = updatedUser;
                                    });
                                  }).catchError((error) {
                                    print('Error al actualizar el usuario: $error');
                                  });
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              showEliminarUsuario(
                                  context, fetchUsers[index].id as String, () {
                                eliminarUsuario(fetchUsers[index].id)
                                    .then((value) {
                                  setState(() {
                                    fetchUsers.removeAt(index);
                                  });
                                }).catchError((error) {
                                  print("error al eliminar el usuario: " +
                                      error.toString());
                                });
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      );
    }
  } catch (error) {
    // Manejar errores en la consulta
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Ocurrió un error al obtener los usuarios: $error'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
