import 'package:flutter/cupertino.dart';
import '../../../Utils/api_helper.dart';
import '../Model/mov_model.dart';

class HomeProvider extends ChangeNotifier{
  String MovieName = "Game of Thrones";

  void ChangeData(String Name){
    MovieName = Name;
    notifyListeners();
  }


  Future<HomeModel> GetApiCall(String Name) async {
    ApiHelper apiHelper = ApiHelper();
    HomeModel h1 = await apiHelper.ApiCall(Name);
    return h1;
  }
}