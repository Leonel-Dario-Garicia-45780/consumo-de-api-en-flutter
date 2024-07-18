import 'package:flutter/material.dart';

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
}