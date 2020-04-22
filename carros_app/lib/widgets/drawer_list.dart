

import 'package:carrosapp/pages/login/login_page.dart';
import 'package:carrosapp/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Margarida"),
                accountEmail: Text("margarida@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  //backgroundImage: AssetImage("assets/images/foto2.jpg"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text("Favorito"),
                subtitle: Text("mais informações ? . . ."),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("Item 1");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                subtitle: Text("mais informações ? . . ."),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("Item 2");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.add_box),
                title: Text("mais opções"),
                subtitle: Text("mais informações ? . . ."),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  print("Item 3");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("sair"),
                subtitle: Text("mais informações ? . . ."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () =>_onClickLogout(context),
              ),
            ],
          ),
      ),
    );
  }

  _onClickLogout(BuildContext context) {
     Navigator.pop(context);
     push(context, LoginPage(), replace: true);
  }
}
