import 'main.dart';
import 'package:flutter/material.dart';

class SignUpPageTeach extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State {
  int week = 0;
  final DateTime date2 = DateTime(2023, 04, 10);
  final DateTime date = DateTime.now();
  void _incrementWeek() {
    final d = date.difference(date2).inDays ~/ 7;
    if(d % 2 == 0) week = 2;
    if(d % 2 == 1) week = 1;
  }
  @override
  void initState() {
    _incrementWeek();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 35.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  _getInputs(),
                  _getSignUp(),
                  _getBottomRow(context),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getHeader() {
  return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Расписание СФУ',
          style: TextStyle(color: Colors.white, fontSize: 37),
        ),
      )
  );
}

_getInputs() {
  return Expanded(
    flex: 4,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        TextField(
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            labelText: 'ФИО/Логин',
            labelStyle: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        /*TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'E-mail',
              labelStyle: TextStyle(color: Colors.white)
          ),
        ),*/
        SizedBox(
          height: 15,
        ),
        TextField(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              labelText: 'Пароль',
              labelStyle: TextStyle(color: Colors.white, fontSize: 18)
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    ),
  );
}

_getSignUp() {
  return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Вход',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey.shade900
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 35,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          )
        ],
      )
  );
}

_getBottomRow(context) {
  return Expanded(
    flex: 1,
    child: Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'ПРЕПОДАВАТЕЛЬ',
            style: TextStyle(
              color: Colors.blueGrey.shade900,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    ),
  );
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