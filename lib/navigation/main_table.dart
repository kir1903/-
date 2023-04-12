import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Maintable extends StatefulWidget {
  final String group;
  const Maintable({Key? key, required this.group,}) : super(key: key);

  @override
  State<Maintable> createState() => _MaintableState();
}

class _MaintableState extends State<Maintable> {
  Color color_a = Colors.blueAccent;
  Color color_b = Colors.blueAccent.shade100;
  int week = 2;
  String Week(w){
    if(w == 1) {
      return 'Четная неделя';
    }
    else{
      return 'Нечетная неделя';
    }
  }
  static DateTime date = DateTime.now();
  Stream<QuerySnapshot> lessons = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: date.weekday).orderBy('time').snapshots();


  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: color_a,
                child: ElevatedButton(
                    onPressed: () { setState(() {
                  lessons = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: date.weekday).where('week', isNotEqualTo: week).where('group', isEqualTo: widget.group.toLowerCase()).snapshots();
                  color_a = Colors.blueAccent.shade100;
                  color_b = Colors.blueAccent;

                });},
                    child: Text('Сегодня')
                ),
              ),
              Container(
                color: color_b,
                child: ElevatedButton(onPressed: (){setState(() {
                  lessons = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: date.weekday + 1).where('week', isNotEqualTo: week ).where('group', isEqualTo: widget.group.toLowerCase()).snapshots();
                  color_a = Colors.blueAccent;
                  color_b = Colors.blueAccent.shade100;
                });},
                    child: Text('Завтра')
                ),
              )
            ],
          ),
          Text(Week(week)),
          Expanded(
            child: StreamBuilder<QuerySnapshot> (
              stream: lessons,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                Week(week);
                if(snapshot.hasError) return Text('Что-то пошло не так.');
                if (!snapshot.hasData) {
                  return const Text('');
                }
                final data = snapshot.requireData;
                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    if(data.docs[index]['week'] != week){
                      if(data.docs[index]['group'] == widget.group.toLowerCase()) {
                        return Card(
                          color: Colors.black12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data.docs[index]['lesson'], style: const TextStyle(
                                      fontSize: 20,
                                    ),),
                                    Text(data.docs[index]['auditorium'], style: const TextStyle(
                                      fontSize: 18,
                                    ),),
                                    Text(data.docs[index]['teacher'], style: const TextStyle(
                                      fontSize: 20,
                                    ),),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(data.docs[index]['time'], style: const TextStyle(
                                      fontSize: 20,
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    }
                  },
                );
              },
            ),
          ),
        ],
    );
  }
}