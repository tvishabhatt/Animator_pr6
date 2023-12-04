import 'package:animator_pr6/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splace_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splace_ScreenState();
  }

}
class Splace_ScreenState extends State<Splace_Screen>with TickerProviderStateMixin{
   late AnimationController _controller;
   late Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,);
    _animation =Tween<double>(end: 50,begin: 0).animate(_controller);
    _controller.addStatusListener((status){
      setState(() {

      });
    });

    _controller.forward();
    Future.delayed(Duration(seconds: 4),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));

    },);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage("assets/sp2.jpg"),height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
      Center(
        child: Text(" Discover\n Your Planet",style:TextStyle(
          fontFamily: "GreatVibes",color: Colors.white,fontSize: _animation.value,fontWeight: FontWeight.bold,)
          ,textAlign: TextAlign.center,),
              ),

        ],
      ),
    );
  }

}