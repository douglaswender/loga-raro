import 'package:flutter/material.dart';
import 'package:loga/ui/add_vacancy_page.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Text(
                'Olá João',
                style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
              ),
            decoration: BoxDecoration(
              color: Colors.black54,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/wallpaper.jpg')
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.directions_car_sharp),
            title: Text('Caminhões'),
            onTap: ()=>{},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Adicionar vaga'),
            onTap: ()=>{
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddVacancy()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: ()=>{},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: ()=>{
              Navigator.of(context).pop()
            },
          ),
        ],
      ),
    );
  }
}
