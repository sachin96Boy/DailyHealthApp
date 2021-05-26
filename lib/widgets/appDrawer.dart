import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8.0,
      child: Column(
        children: [
          AppBar(
            title: Text("Covid Drawer Sachin"),
            backgroundColor: Colors.purple[500],
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: ()=> Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
