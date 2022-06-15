import 'package:assignment3/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2000),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>Home()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.cyan,
      body: Center(
        child: Container(
            child: Text("Welcome To Score Board",style: TextStyle(fontSize: 20,color: Colors.white),)
            )

        ),
      );
  }
}
