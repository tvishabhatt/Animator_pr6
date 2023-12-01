import 'package:animator_pr6/DetailPage.dart';
import 'package:animator_pr6/PlanetsModal.dart';
import 'package:animator_pr6/ThemeModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }


}
class HomePageState extends State<HomePage>{
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<Planets_Provider>(context,listen: false).planets_fun();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final themeprovider=Provider.of<ThemeProvider>(context, listen: false);
    // TODO: implement build
    return Consumer(
        builder: (context,ThemeProvider themeModal,child) {
          return Scaffold(
            backgroundColor: themeModal.themeModal.isDark?Colors.white:Colors.black,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: themeModal.themeModal.isDark?Color(0xff00203F):
              Color(0xff13af67),
              title: Text("Planets",style: TextStyle(color: themeModal.themeModal.isDark?Colors.white:Colors.white,fontSize: 20 ,fontWeight: FontWeight.w500),),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).ChangeTheme();
                },
                  icon: (Provider.of<ThemeProvider>(context).themeModal.isDark)
                      ? Icon(Icons.mode_night,color: themeModal.themeModal.isDark?Colors.black:Colors.white,)
                      :  Icon(Icons.light_mode_rounded,color: themeModal.themeModal.isDark?Colors.black:Colors.white),
                ),
              ],
            ),
            body: Stack(
              children: [
                Image(image: NetworkImage("https://media.istockphoto.com/id/1035676256/photo/background-of-galaxy-and-stars.jpg?s=612x612&w=0&k=20&c=dh7eWJ6ovqnQZ9QwQQlq2wxqmAR7mgRlQTgaIylgBwc="),height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                Consumer(
                  builder: (context, Planets_Provider planets_provider, child) {
                    return ListView.separated(
                        itemBuilder:(context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(selectedindex: index),));
                              },
                              child: Card(
                                color: themeModal.themeModal.isDark?Colors.black:
                                Colors.white,
                                child: Row(
                                  children: [
                                    Hero(
                                        tag: '$PlanetList[index].name',
                                        child: Image(image: NetworkImage(PlanetList[index].image),height: 100,width: 100,fit: BoxFit.fill,)),
                                    SizedBox(width: 30,),
                                    Text(PlanetList[index].name,style: TextStyle(color:  themeModal.themeModal.isDark?Colors.white:Colors.black,fontWeight: FontWeight.w700,fontSize: 18),),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20,);
                        }, itemCount: PlanetList.length);
                  },
                ),
              ],
            ),
          );
        }
    );
  }

}