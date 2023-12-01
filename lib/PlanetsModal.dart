import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PlanetsModal{
  String position='';
  String name='';
  String image='';
  String velocity='';
  String distance='';
  String description='';


  PlanetsModal({required this.position,required this.name,required this.image,required this.velocity,required this.distance,required this.description});


 factory PlanetsModal .fromJson(Map<String,dynamic> data){
    return PlanetsModal(position: data['position'],
        name: data['name'],
        image: data['image'],
        velocity: data['velocity'],
        distance: data['distance'],
        description: data['description']);
  }

  static List<PlanetsModal> parselist(List value){
    List<PlanetsModal> listdata=value.map((e) => PlanetsModal.fromJson(e)).toList();
    return listdata;
  }
}


List<PlanetsModal> PlanetList=[];
class Planets_Provider extends ChangeNotifier{
  void planets_fun()async{
    String data=await rootBundle.loadString("assets/planets.json");
    List mainList=jsonDecode(data);
    PlanetList=PlanetsModal.parselist(mainList);
    notifyListeners();
  }
}