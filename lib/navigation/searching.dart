import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final String group;
  const Search({Key? key, required this.group}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();

}
final Stream<QuerySnapshot> lessons_1 = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: 1).orderBy('time').snapshots();
final Stream<QuerySnapshot> lessons_2 = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: 2).orderBy('time').snapshots();
final Stream<QuerySnapshot> lessons_3 = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: 3).orderBy('time').snapshots();
final Stream<QuerySnapshot> lessons_4 = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: 4).orderBy('time').snapshots();
final Stream<QuerySnapshot> lessons_5 = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: 5).orderBy('time').snapshots();
final Stream<QuerySnapshot> lessons_6 = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: 6).orderBy('time').snapshots();

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text('Понедельник'),
          Expanded(
            child: StreamBuilder<QuerySnapshot> (
                stream: lessons_1,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasError) return Text('Что-то пошло не так.');
                  if (!snapshot.hasData) {
                    return const Text('');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      print(data.size);
                      if(data.size != 0){
                        if(data.docs[index]['group'].toString().toLowerCase().startsWith(widget.group.toLowerCase())){
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
                                      Text(data.docs[index]['lesson'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                      Text(data.docs[index]['auditorium'], style: TextStyle(
                                        fontSize: 18,
                                      ),),
                                      Text(data.docs[index]['teacher'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.docs[index]['time'], style: TextStyle(
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
                      else{
                        return Card(
                          color: Colors.black12,
                          child: Text('Занятий нет'),
                        );
                      }
                    },
                  );
                },
              ),
          ),
          Text('Вторник'),
          Expanded(
            child: StreamBuilder<QuerySnapshot> (
                stream: lessons_2,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasError) return Text('Что-то пошло не так.');
                  if (!snapshot.hasData) {
                    return const Text('');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      if(data.docs.length != 0){
                        if(data.docs[index]['group'].toString().toLowerCase().startsWith(widget.group.toLowerCase())){
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
                                      Text(data.docs[index]['lesson'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                      Text(data.docs[index]['auditorium'], style: TextStyle(
                                        fontSize: 18,
                                      ),),
                                      Text(data.docs[index]['teacher'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.docs[index]['time'], style: TextStyle(
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
                      else{
                        return Card(
                          color: Colors.black12,
                          child: Text('Занятий нет'),
                        );
                      }
                    },
                  );
                },
              ),
          ),
          Text('Среда'),
          Expanded(
            child: StreamBuilder<QuerySnapshot> (
                stream: lessons_3,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasError) return Text('Что-то пошло не так.');
                  if (!snapshot.hasData) {
                    return const Text('');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      if(data.docs.length != 0){
                        if(data.docs[index]['group'].toString().toLowerCase().startsWith(widget.group.toLowerCase())){
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
                                      Text(data.docs[index]['lesson'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                      Text(data.docs[index]['auditorium'], style: TextStyle(
                                        fontSize: 18,
                                      ),),
                                      Text(data.docs[index]['teacher'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.docs[index]['time'], style: TextStyle(
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
                      else{
                        return Card(
                          color: Colors.black12,
                          child: Text('Занятий нет'),
                        );
                      }
                    },
                  );
                },
              ),
          ),
          Text('Четверг'),
          Expanded(
            child: StreamBuilder<QuerySnapshot> (
                stream: lessons_4,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasError) return Text('Что-то пошло не так.');
                  if (!snapshot.hasData) {
                    return const Text('');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      if(data.docs.isNotEmpty){
                        if(data.docs[index]['group'].toString().toLowerCase().startsWith(widget.group.toLowerCase())){
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
                                      Text(data.docs[index]['lesson'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                      Text(data.docs[index]['auditorium'], style: TextStyle(
                                        fontSize: 18,
                                      ),),
                                      Text(data.docs[index]['teacher'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.docs[index]['time'], style: TextStyle(
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
                      else{
                        return Card(
                          color: Colors.black12,
                          child: Text('Занятий нет'),
                        );
                      }
                    },
                  );
                },
              ),
          ),
          Text('Пятница'),
          Expanded(
            child: StreamBuilder<QuerySnapshot> (
                stream: lessons_5,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasError) return Text('Что-то пошло не так.');
                  if (!snapshot.hasData) {
                    return const Text('');
                  }
                  final data = snapshot.requireData;
                  return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      if(data.docs.isNotEmpty){
                        if(data.docs[index]['group'].toString().toLowerCase().startsWith(widget.group.toLowerCase())){
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
                                      Text(data.docs[index]['lesson'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                      Text(data.docs[index]['auditorium'], style: TextStyle(
                                        fontSize: 18,
                                      ),),
                                      Text(data.docs[index]['teacher'], style: TextStyle(
                                        fontSize: 20,
                                      ),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.docs[index]['time'], style: TextStyle(
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
                      else{
                        return Card(
                          color: Colors.black12,
                          child: Text('Занятий нет'),
                        );
                      }
                    },
                  );
                },
              ),
          ),
          Text('Суббота'),
          Expanded(
            child: StreamBuilder<QuerySnapshot> (
              stream: lessons_6,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(snapshot.hasError) return Text('Что-то пошло не так.');
                if (!snapshot.hasData) {
                  return const Text('');
                }
                final data = snapshot.requireData;
                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    if(data.docs.isNotEmpty){
                      if(data.docs[index]['group'].toString().toLowerCase().startsWith(widget.group.toLowerCase())){
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
                                    Text(data.docs[index]['lesson'], style: TextStyle(
                                      fontSize: 20,
                                    ),),
                                    Text(data.docs[index]['auditorium'], style: TextStyle(
                                      fontSize: 18,
                                    ),),
                                    Text(data.docs[index]['teacher'], style: TextStyle(
                                      fontSize: 20,
                                    ),),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(data.docs[index]['time'], style: TextStyle(
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
                    else{
                      return Card(
                        color: Colors.black12,
                        child: Text('Занятий нет'),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ]
    );
  }
}
