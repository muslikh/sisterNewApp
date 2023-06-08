import 'package:flutter/material.dart';
import 'package:gridview_menu/gridview_menu.dart' as grid;
import 'package:sister/screen/home.dart';

class MenuHomeScreen extends StatefulWidget {
  final Color color = Color.fromRGBO(70, 103, 48, 1);

  @override
  _MenuHomeScreenState createState() => _MenuHomeScreenState();
}

class _MenuHomeScreenState extends State<MenuHomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<grid.MenuItem> menuItem = <grid.MenuItem>[
      grid.MenuItem(
        icon: Icons.event,
        color: widget.color,
        title: 'Administrativo',
        subtitle: 'Administrativo',
        child: Home(),
      ),
      grid.MenuItem(
        icon: Icons.event,
        color: widget.color,
        title: 'Administrativo',
        subtitle: 'Administrativo',
        child: Home(),
      ),
      grid.MenuItem(
        icon: Icons.event,
        color: widget.color,
        title: 'Administrativo',
        subtitle: 'Administrativo',
        child: Home(),
      ),
      grid.MenuItem(
        icon: Icons.event,
        color: widget.color,
        title: 'Administrativo',
        subtitle: 'Administrativo',
        child: Home(),
      ),
    ];
    return Home(
      menuItem: menuItem,
    );
  }
}
