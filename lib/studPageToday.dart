import 'dart:ui';

import 'main.dart';
import 'package:flutter/material.dart';

class PageStudToday extends StatefulWidget{
  @override
  _PageStudToday createState() => _PageStudToday();
}

class _PageStudToday extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
      child: Column(

        children: [
          SizedBox(height: 50,),
          Text("Четная неделя", style: TextStyle(color: Colors.white, fontSize: 40,),),
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
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index){
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: ListTile(
                          /*leading: Text("текст1"),*/
                          title: Text(
                            "Название предмета \n Время \n Аудитория \n Преподаватель ",
                            style: TextStyle(fontSize: 20),
                          ),
                          subtitle: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade50),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {  },
                          child: Text('Оставить комментарий', style: TextStyle(fontSize: 17),),),
                          /*trailing: Text("текст4"),*/
                        ),
                      );
                    }

                  )
                ],
              )
          )
        ],
      ),
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