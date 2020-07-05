import 'package:flutter/material.dart';
import 'package:xlo/commom/custom_drawer/custom_drawer.dart';
import 'package:xlo/screens/home/widgets/search_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    _openSearch(String currentSearch) async {
      final String search = await showDialog(context: context,
      builder: (context) => SearchDialog(currentSearch: currentSearch),
      );

    }

    return Scaffold(
      appBar: AppBar(
        title: Text("MARKET EASY"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              _openSearch("");
            },
          )
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
