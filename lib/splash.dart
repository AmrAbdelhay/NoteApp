import 'package:flutter/material.dart';
import 'package:noteapp/page/Notes.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NotesPage(),)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        heightFactor: 150,
        widthFactor: 150,
        child:    Container(
          width: 150,
          height: 150,
          child: Image.asset(
            'assets/images/Noteicon.png',
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
