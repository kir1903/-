import 'package:flutter/material.dart';
import 'package:project/navigation/main_table.dart';
import 'package:project/navigation/searching.dart';


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {

  int sectionindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Расписание СФУ'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: sectionindex == 0 ? Maintable() : Search(),
      bottomNavigationBar:  BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled),
              label: 'Расписание'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Поиск'
          )
        ],
        currentIndex: sectionindex,
        backgroundColor: Colors.deepOrange,
        selectedItemColor: Colors.white,
        onTap: (int index){
          setState(() {
            sectionindex = index;
          });
        },
      ),
      );
  }
}
