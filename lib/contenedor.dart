import 'package:consumo_de_api/screens/01_Home.dart';
import 'package:consumo_de_api/screens/formularios/02_inicioSesionUsuario.dart';
import 'package:consumo_de_api/screens/04_perfilUsuario.dart';
import 'package:consumo_de_api/screens/06_MenuUser.dart';
// import 'package:consumo_de_api/screens/formularios/2_1.dart';
import 'package:consumo_de_api/screens/formularios/03_registroUsuario.dart';
import 'package:consumo_de_api/screens/productosPage.dart';
import 'package:flutter/material.dart';


class API extends StatelessWidget {
  const API({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API APP",
      home: HomePage(),
      // home: ProductosPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => Login(),
        '/registro': (context) => PaginaRegistro(),
        '/perfil':(context) => Perfilusuario(),
        '/users':(context)=> MenuUsers(),
        '/productos': (context) => ProductosPage(),
      },
    );
  }
}


























/* import 'package:flutter/material.dart';

class MenuUsers extends StatefulWidget {
  const MenuUsers({super.key});

  @override
  State<MenuUsers> createState() => _MenuUsersState();
}

class _MenuUsersState extends State<MenuUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[400],
          foregroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back, color: Colors.white,),
          ),
          title: Text(
            'Users',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/1535/1535024.png",
              width: 300,
              height: 300,
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text("usuarios"),
              leading:  Icon(Icons.connect_without_contact_rounded),
              trailing: Icon(Icons.arrow_right_alt_outlined),
              onTap: (){},
            )
          ],

        )
    );
  }
} */