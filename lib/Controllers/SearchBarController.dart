import 'package:flutter/material.dart';

class SearchBarController with ChangeNotifier {

  double width;
  void widthSetter(double screenWidth){
    width = screenWidth;
    notifyListeners();
  }

  double searchBarWidth;
  void searchBarWidthChanger(){
    if (state){
      searchBarWidth = width*.88;
    }else{
      searchBarWidth = width*.15;
    }
    print(searchBarWidth);
    notifyListeners();
  }

  bool state = false;
  void stateChanger() {
    if(state == true){
      state = false;
    }else{
    state = true;
    }
    print(
      state
    );
    notifyListeners();
  }
}