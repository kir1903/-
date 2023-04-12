import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/scenes/Main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String group_name = '';
  static const groupKey = 'group';

  @override
  void initState(){
    _initGroup();
    super.initState();
    if(group_name != ''){
      Navigator.push(context,MaterialPageRoute(builder: (context) => Main(group: group_name)));
    }

  }

  Future _initGroup() async {
    group_name = (await _getFirstAuth())!;
  }

  Future _setFirstAuth() async {
     var pres = await SharedPreferences.getInstance();
     pres.setString(groupKey, group_name);
  }
  Future<String?> _getFirstAuth() async {
    var pres = await SharedPreferences.getInstance();
    if(group_name == '') return 'ki20-12b';
    return pres.getString(groupKey);
  }
  void _incrementGroup(value) async{
    setState(() {
      group_name = value;
    });

    await _setFirstAuth();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Расписание СФУ'),
      ),
      body: Column(
        children:[
          ElevatedButton(onPressed: () async {
           await showDialog<void>(
               context: context,
               builder: (BuildContext context) {
                 return AlertDialog(
                   content: Text(
                     'Введите название вашей группы'
                   ),
                   actions: <Widget>[
                     TextField(
                       onSubmitted: (String value) {
                         _incrementGroup(value);
                       },
                     ),
                     TextButton(onPressed: () {
                       if(group_name.isNotEmpty){
                         Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Main(group: group_name))
                          );
                       }
                       else{
                         AlertDialog(
                           content: Text(
                             'Вы не ввели название группы'
                           ),
                           actions: [
                             TextButton(
                                 onPressed: () {
                                   },
                                 child: Text('OK')
                             )
                           ],
                         );
                       }


                     },
                         child: const Text('OK'))
                   ],
                 );
               }
           );
          }, child: Text('Студент'))
        ],
      ),
    );
  }
}