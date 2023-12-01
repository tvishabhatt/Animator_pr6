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
  late AnimationController _controller2;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller2 = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1
    );
    animation = CurvedAnimation(parent: _controller2, curve: Curves.fastOutSlowIn);

    _controller2.forward();
    Future.delayed(Duration(seconds: 5),() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Image(image: NetworkImage('https://img.freepik.com/free-photo/ultra-detailed-nebula-abstract-wallpaper-9_1562-754.jpg'),height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
          Center(
            child: FadeTransition(
              opacity: animation,
                child: Text(" Discover\n Your Planet",style:TextStyle(fontFamily: "GreatVibes",color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
          )
        ],
      ),
    );
  }

}