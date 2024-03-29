import 'package:firebase_core/firebase_core.dart';
import 'package:project/firebase_options.dart';

import 'signupStudent.dart';
import 'signupTeach.dart';
import 'studPageToday.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State {
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
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: <Widget>[
                    _getHeader(),
                    _getInputs(context),
                    //_getSignIn(),
                    //_getBottomRow(context),

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
      flex: 1,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text('Расписание \n СФУ',
        style: TextStyle(
            color: Colors.white, fontSize: 39
        ),
      ),
    ),
  );
}

_getInputs(c) {
  return Expanded(
    flex: 2,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.black),
              fixedSize: MaterialStateProperty.all(const Size(320, 60)),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                  )
              ),

            ),
            onPressed: () {},
            child: Text (
                'Преподаватель',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26),
            ),
        ),

        SizedBox(height: 25), SizedBox(width: 25),

        ElevatedButton(
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.black),
              fixedSize: MaterialStateProperty.all(const Size(320, 60)),
              shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                  )
              )
          ),
          onPressed: () {
            Navigator.push(
                c,
              MaterialPageRoute(builder: (c) => SignUpPageStud())
            );
          },
          child: Text (
            'Студент',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26),
          ),
        )
      ],
    ),

  );
}

/*_getSignIn() {
  return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Вход', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
          CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            radius: 40,
            child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
          )
        ],
      )
  );
}*/

/*_getBottomRow(context) {
  return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SignUpPage()));
            },
            child: Text(
              'Регистрация',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline
              ),
            ),
          )
        ],
      )
  );
}*/

class BackgroundSignIn extends CustomPainter {
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
    blueWave.lineTo(sw, sh*0.5);
    blueWave.quadraticBezierTo(sw*0.5, sh*0.45, sw*0.2, 0);
    blueWave.close();
    paint.color = Colors.blue.shade300;
    canvas.drawPath(blueWave, paint);

    //Gray
    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh*0.1);
    greyWave.cubicTo(sw*0.95, sh*0.15, sw*0.65, sh*0.15, sw*0.6, sh*0.38);
    greyWave.cubicTo(sw*0.52, sh*0.52, sw*0.05, sh*0.45, 0, sh*0.4);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);

    //Yellow
    Path yellowWave = Path();
    yellowWave.lineTo(sw*0.7, 0);
    yellowWave.cubicTo(sw*0.6, sh*0.05, sw*0.27, sh*0.01, sw*0.18, sh*0.12);
    yellowWave.quadraticBezierTo(sw*0.12, sh*0.2, 0, sh*0.2);
    yellowWave.close();
    paint.color = Colors.orange.shade300;
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
  
}