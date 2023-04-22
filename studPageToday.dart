import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class PageStudToday extends StatefulWidget{
  final String group;
  final int week;
  const PageStudToday({Key? key, required this.group, required this.week}) : super(key: key);

  @override
  _PageStudToday createState() => _PageStudToday();


}

class _PageStudToday extends State<PageStudToday> with TickerProviderStateMixin {

  String Week(w){
      if(w == 1) {
        return 'Четная неделя';
      }
      else{
        return 'Нечетная неделя';
      }
  }
  static DateTime date = DateTime.now();

  @override
  void initState(){
    _lessonWeekAdd();
    super.initState();
  }

  Stream<QuerySnapshot> lessons_today = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: date.weekday).orderBy('time').snapshots();
  Stream<QuerySnapshot> lessons_tomorrow = FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: date.weekday + 1).orderBy('time').snapshots();
  List<Stream<QuerySnapshot>> lessons_week = [];
  List<String> days = ['Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота'];
  void _lessonWeekAdd() {
    for(int i = 1; i < 7; i++){
      lessons_week.add(FirebaseFirestore.instance.collection('Timetable').where('weekday', isEqualTo: i).orderBy('time').snapshots());
    }
  }
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Text(Week(widget.week), style: TextStyle(color: Colors.white, fontSize: 40,),),
          SizedBox(height: 20,),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12,
                ),
                controller: tabController,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 30),
                tabs: [
                  Tab(child: Text("Сегодня", style: TextStyle(color: Colors.black, fontSize: 26),),),
                  Tab(child: Text("Завтра", style: TextStyle(color: Colors.black, fontSize: 26),),),
                  Tab(child: Text("Неделя", style: TextStyle(color: Colors.black, fontSize: 26),),)
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  StreamBuilder<QuerySnapshot> (
                        stream: lessons_today,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.hasError) return Text('Что-то пошло не так.');
                          if (!snapshot.hasData) {
                            return const Text('');
                          }
                          final data = snapshot.requireData;
                          return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data?.size,
                              itemBuilder: (context, index) {
                                if(data.docs[index]['group'] == widget.group.toLowerCase() && data.docs[index]['week'] != widget.week){
                                  return Card(
                                    margin: EdgeInsets.symmetric(horizontal: 30,
                                        vertical: 10),
                                    child: ListTile(
                                      title: Text(
                                        "${data.docs[index]['lesson']} \n ${data
                                            .docs[index]['time']} \n ${data
                                            .docs[index]['auditorium']} \n ${data
                                            .docs[index]['teacher']} ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                );
                                }
                                else{
                                  return Text('');
                                }
                              }
                              );
                        }
                        ),
                  StreamBuilder<QuerySnapshot> (
                        stream: lessons_tomorrow,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if(snapshot.hasError) return Text('Что-то пошло не так.');
                          if (!snapshot.hasData) {
                            return const Text('');
                          }
                          final data = snapshot.requireData;
                          return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data?.size,
                              itemBuilder: (context, index) {
                                if(data.docs[index]['group'] == widget.group.toLowerCase() && data.docs[index]['week'] != widget.week){
                                  return Card(
                                    margin: EdgeInsets.symmetric(horizontal: 30,
                                        vertical: 10),
                                    child: ListTile(
                                      title: Text(
                                        "${data.docs[index]['lesson']} \n ${data
                                            .docs[index]['time']} \n ${data
                                            .docs[index]['auditorium']} \n ${data
                                            .docs[index]['teacher']} ",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                );
                                }
                                else{
                                  return Text('');
                                }
                              }
                              );
                        }
                        ),
                    ListView.separated(
                        itemBuilder: (context, i) {
                          if(i == 0){
                            return Column(
                              children: [
                                Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Divider(color: Colors.black,thickness: 25, height: 19,),
                              Column(
                                children: [
                                  Container(
                                    width: 205,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(Radius.circular(60)))
                                    ),
                                ],
                              ),
                              Divider(color: Colors.white, thickness: 20,),
                              Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  height: 50,
                                    child: Text('Понедельник', style: TextStyle(color: Colors.black, fontSize: 20)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(60))),
                                  ),
                              ],
                            ),
                            ]
                          ),
                                StreamBuilder<QuerySnapshot> (
                              stream: lessons_week[i],
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError)
                                  return Text('Что-то пошло не так.');
                                if (!snapshot.hasData) {
                                  return const Text('');
                                }
                                final data = snapshot.requireData;
                                return ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.size,
                                    itemBuilder: (context, index) {
                                      if (data.docs[index]['group'] == widget.group.toLowerCase()) {
                                        return Card(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 30,
                                                vertical: 10),
                                            child: ListTile(
                                              title: Text(
                                                "${data
                                                    .docs[index]['lesson']} \n ${data
                                                    .docs[index]['time']} \n ${data
                                                    .docs[index]['auditorium']} \n ${data
                                                    .docs[index]['teacher']} ",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            )
                                        );
                                      }
                                      else {
                                        return Text('');
                                      }
                                    }
                                );
                              }
                              ),
                              ],
                            );
                          }
                          return StreamBuilder<QuerySnapshot> (
                              stream: lessons_week[i],
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                if(snapshot.hasError) return Text('Что-то пошло не так.');
                                if (!snapshot.hasData) {
                                  return const Text('');
                                }
                                final data = snapshot.requireData;
                                return ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.data?.size,
                                    itemBuilder: (context, index) {
                                      if(data.docs[index]['group'] == widget.group.toLowerCase()){
                                        return Card(
                                            margin: EdgeInsets.symmetric(horizontal: 30,
                                                vertical: 10),
                                            child: ListTile(
                                              title: Text(
                                                "${data.docs[index]['lesson']} \n ${data.docs[index]['time']} \n ${data.docs[index]['auditorium']} \n ${data.docs[index]['teacher']} ",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            )
                                        );
                                      }
                                      else {
                                        return Text('');
                                      }
                                    }
                              );
                        }
                        );
                        },
                        separatorBuilder: (context, index){

                          return Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Divider(color: Colors.black,thickness: 24, height: 20,),
                              Column(
                                children: [
                                  Container(
                                    width: 205,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(Radius.circular(60)))
                                    ),
                                ],
                              ),
                              Divider(color: Colors.white, thickness: 20,),
                              Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  height: 50,
                                    child: Text('${days[index]}', style: TextStyle(color: Colors.black, fontSize: 20)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(60))),
                                  ),
                              ],
                            ),
                            ]
                          );
                        },
                        itemCount: 6
                    )
                ],
              )
          )
        ],
      )
      ),
    );
  }
}



class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    //Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh*0.65);
    blueWave.cubicTo(sw*0.8, sh*0.8, sw*0.5, sh*0.8, sw*0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    //Gray
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh*0.3);
    greyWave.cubicTo(sw*0.65, sh*0.45, sw*0.25, sh*0.35, 0, sh*0.5);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}