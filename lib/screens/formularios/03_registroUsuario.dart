import 'package:consumo_de_api/models/user.dart';
import 'package:consumo_de_api/services/crear_usuario.dart';
import 'package:flutter/material.dart';

class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({Key? key}) : super(key: key);

  @override
  State<PaginaRegistro> createState() => _PaginaRegistroState();
}

class _PaginaRegistroState extends State<PaginaRegistro> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cedulaControlador = TextEditingController();
  final TextEditingController _nombreControlador = TextEditingController();
  final TextEditingController _telefonoControlador = TextEditingController();
  final TextEditingController _direccionControlador = TextEditingController();
  final TextEditingController _emailControlador = TextEditingController();
  final TextEditingController _constrasenaControlador = TextEditingController();
  Future<User>? _futureUsuarios;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/758/758669.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Regístrate",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  //! cedula
                  TextFormField(
                    controller: _cedulaControlador,
                    decoration: InputDecoration(
                      labelText: "Cedula",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese la cedula completa";
                      }
                      if (int.tryParse(value) == null) {
                        return "Ingrese un número válido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  //! nombre
                  TextFormField(
                    controller: _nombreControlador,
                    decoration: InputDecoration(
                      labelText: "Nombre completo",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese nombre completo";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  //! telefono
                  TextFormField(
                    controller: _telefonoControlador,
                    decoration: InputDecoration(
                      labelText: "Telefono",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese el teléfono completo";
                      }
                      if (int.tryParse(value) == null) {
                        return "Ingrese un número válido";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  //! direccion
                  TextFormField(
                    controller: _direccionControlador,
                    decoration: InputDecoration(
                      labelText: "Direccion",
                      prefixIcon: Icon(Icons.home),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese la dirección completa";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  //! email
                  TextFormField(
                    controller: _emailControlador,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese el email completo";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  //! contraseña
                  TextFormField(
                    controller: _constrasenaControlador,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Ingrese la contraseña completa";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    //! boton de registrar
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _futureUsuarios = createUsuarios(
                              int.parse(_cedulaControlador.text),
                              _nombreControlador.text,
                              int.parse(_telefonoControlador.text),
                              _direccionControlador.text,
                              _emailControlador.text,
                              _constrasenaControlador.text,
                            );
                          });
                          _futureUsuarios!.then((user) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Registro exitoso')),
                            );
                            Navigator.pushNamed(context, '/home');
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Error al registrar: $error')),
                            );
                          });
                        }
                      },
                      child: Text("Registrarse"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[400],
                          foregroundColor: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("¿Tienes una cuenta?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            "Inicia sesion",
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
