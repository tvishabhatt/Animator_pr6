

import 'package:animator_pr6/Bookmark.dart';
import 'package:animator_pr6/PlanetsModal.dart';
import 'package:animator_pr6/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget{
  int selectedindex;
  DetailPage({required this.selectedindex});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailPageState(selectedindex);
  }

}
class DetailPageState extends State<DetailPage> with TickerProviderStateMixin{
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> animation;
  int selectedindex;
  DetailPageState(this.selectedindex);
  @override
  void initState() {
    super.initState();
    _controller =AnimationController(vsync: this, duration: Duration(seconds: 15),)..repeat();
   _controller2=AnimationController(vsync: this,duration: Duration(seconds: 3),);
   animation=Tween<double>(end: 1.0,begin: 0.0).animate(_controller2);
   _controller2.forward();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Consumer(
        builder: (context,ThemeProvider themeModal,child) {
          return Scaffold(

            backgroundColor: themeModal.themeModal.isDark?Colors.black:Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: themeModal.themeModal.isDark?Color(0xff00203F):
              Color(0xff13af67),
              title: Text("${PlanetList[selectedindex].name}",style: TextStyle(color: themeModal.themeModal.isDark?Colors.white:Colors.white,fontSize: 20 ,fontWeight: FontWeight.w500),),
              centerTitle: true,
              actions: [
                Consumer(
                  builder: (context,Bookmark bookmarkporvider,child) {
                    return IconButton(onPressed: () {
                   bookmarkporvider.saveStringList("${PlanetList[selectedindex].name}");
                    }, icon: Icon(bookmarkporvider.stringList.contains(PlanetList[selectedindex].name)?Icons.favorite:Icons.favorite_border,color: Colors.red,size: 20,));
                  }
                ),
                IconButton(onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).ChangeTheme();
                },
                  icon: (Provider.of<ThemeProvider>(context).themeModal.isDark)
                      ? Icon(Icons.mode_night,color: themeModal.themeModal.isDark?Colors.black:Colors.white,)
                      :  Icon(Icons.light_mode_rounded,color: themeModal.themeModal.isDark?Colors.black:Colors.white),
                ),
              ],
            ),
            body: FadeTransition(opacity: animation,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Hero(


                        tag: '${PlanetList[selectedindex].name}',
                        child:    RotationTransition(
                            alignment:Alignment.center,
                            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                            child: Transform.rotate(
                                angle:2.2,
                                child: Image(image: NetworkImage(PlanetList[selectedindex].image),height: 300,width: 300,fit: BoxFit.fill,))),
                      ),
                    ),
                    Text("${PlanetList[selectedindex].name}",style: TextStyle(color: themeModal.themeModal.isDark?Colors.white:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Text("=>  Position of ${PlanetList[selectedindex].name} is ${PlanetList[selectedindex].position}.",style: TextStyle(color: themeModal.themeModal.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold,),),
                    Text("=>  Velocity of ${PlanetList[selectedindex].name} is ${PlanetList[selectedindex].velocity}.",style: TextStyle(color: themeModal.themeModal.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    Text("=>  ${PlanetList[selectedindex].description}",style: TextStyle(color: themeModal.themeModal.isDark?Colors.white:Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),
            ),),
          );
        }
    );
  }

}