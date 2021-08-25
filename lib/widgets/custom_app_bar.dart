import 'package:flutter/material.dart';

import 'package:health_app/config/palatte.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {
          
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          iconSize: 28.0,
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight); //create a custom height for the new appbar
}
