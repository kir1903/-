import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Maintable extends StatefulWidget {
  const Maintable({Key? key}) : super(key: key);

  @override
  State<Maintable> createState() => _MaintableState();
}

class _MaintableState extends State<Maintable> {


  static DateTime date = DateTime.now();
  Stream<QuerySnapshot> lessons = FirebaseFirestore.instance.collection('Lessons').where('weekday', isEqualTo: date.weekday).snapshots();


  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () { setState(() {
              lessons = FirebaseFirestore.instance.collection('Lessons').where('weekday', isEqualTo: date.weekday).snapshots();
            });},
                child: Text('Сегодня')
            ),
            ElevatedButton(onPressed: (){setState(() {
              lessons = FirebaseFirestore.instance.collection('Lessons').where('weekday', isEqualTo: date.weekday + 1).snapshots();
            });},
                child: Text('Завтра')
            )
          ],
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot> (
            stream: lessons,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.hasError) return Text('Что-то пошло не так.');
              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                    return Card(
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.docs[index]['name'], style: TextStyle(
                                fontSize: 20,
                              ),),
                              Text('УЛК420', style: TextStyle(
                                fontSize: 18,
                              ),),
                              Text('Брежнев', style: TextStyle(
                              fontSize: 20,
                              ),),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data.docs[index]['time'], style: TextStyle(
                                fontSize: 20,
                              )),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
            },
          ),
        ),
      ],
    );
  }
}
