import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Расписание СФУ'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/Main',(route) => false);
          }, child: Text('Студент'))
        ],
      ),
    );
  }
}
