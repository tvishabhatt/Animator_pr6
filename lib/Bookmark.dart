import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookmark extends ChangeNotifier{
  List<String> _stringList=[];

  List<String> get stringList => _stringList;

  void saveStringList(String value)async{
    _stringList.add(value);
    saveStringListToSharedPrefs();
    notifyListeners();
  }

  void removeStringList(String value)async{
    _stringList.remove(value);
    saveStringListToSharedPrefs();
    notifyListeners();
  }

  void saveStringListToSharedPrefs()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    await prefs.setStringList('stringList',_stringList);

  }

  void getStringListFromSharedPrefs()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    List<String>? storedList=prefs.getStringList('stringList');
    if(storedList != null){
      _stringList=storedList;
    }
    notifyListeners();
  }
}