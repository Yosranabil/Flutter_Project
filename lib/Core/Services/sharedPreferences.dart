import 'package:practice/shared/Constants/Variables/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService{
  Future createCache(String location) async{

    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString("location", locController.text.toString());
  }
  Future readCache(String location) async{

    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString("location");
    return cache;
  }
  Future removeCache(String location) async{

    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.remove("location");
  }
}

