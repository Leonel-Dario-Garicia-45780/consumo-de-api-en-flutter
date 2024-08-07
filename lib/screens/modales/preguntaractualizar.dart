//* por gpt porque me mamé

import 'package:consumo_de_api/models/user.dart';
import 'package:flutter/material.dart';

void showActualizarUsuario(
    BuildContext context, User user, Function(User) onUserUpdated) {
  // Controladores para los campos de texto
  TextEditingController nombreController = TextEditingController(text: user.nombre);
  TextEditingController telefonoController = TextEditingController(text: user.telefono.toString());
  TextEditingController direccionController = TextEditingController(text: user.direccion);
  TextEditingController emailController = TextEditingController(text: user.email);
  TextEditingController contrasenaController = TextEditingController(text: user.contrasena);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Actualizar Usuario'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Campo de cédula solo de lectura
            TextFormField(
              initialValue: user.cedula.toString(),
              decoration: InputDecoration(labelText: 'Cédula'),
              readOnly: true,
            ),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: telefonoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Teléfono'),
            ),
            TextField(
              controller: direccionController,
              decoration: InputDecoration(labelText: 'Dirección'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Crear un objeto User con los nuevos valores
              User updatedUser = User(
                cedula: user.cedula, // Mantener la cédula sin cambios
                nombre: nombreController.text,
                telefono: int.parse(telefonoController.text),
                direccion: direccionController.text,
                email: emailController.text,
                contrasena: contrasenaController.text,
              );

              // Llamar a la función de actualización
              onUserUpdated(updatedUser);
              Navigator.of(context).pop();
            },
            child: Text('Actualizar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
        ],
      );
    },
  );
}








// import 'package:consumo_de_api/models/user.dart';
// import 'package:flutter/material.dart';

// // Función para mostrar el modal de confirmación de actualización
// void showActualizarUsuario(BuildContext context, User user, VoidCallback onUserUpdated) {
//   TextEditingController nameController = TextEditingController(text: user.nombre);

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Actualizar Usuario'),
//         content: TextField(
//           controller: nameController,
//           decoration: InputDecoration(labelText: 'Nombre'),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // Aquí puedes realizar la lógica para actualizar el usuario
//               onUserUpdated();
//               Navigator.of(context).pop();
//             },
//             child: Text('Actualizar'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancelar'),
//           ),
//         ],
//       );
//     },
//   );
// }





// // import 'package:flutter/material.dart';

// // void showActualizarUsuario(BuildContext context, Users user, VoidCallback onUserUpload ){

// //   TextEditingController nameController = TextEditingController(text: user)
// // } 


