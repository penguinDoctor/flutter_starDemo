import 'package:flutter/material.dart';

class FXHomeBottomNavigationItem extends BottomNavigationBarItem{

  FXHomeBottomNavigationItem(String title,String imageName,String activeImageName):super(

      title:Text(title),
      icon:Image.asset(imageName),
      activeIcon:Image.asset(activeImageName),
  );
}


List<FXHomeBottomNavigationItem> items() {

  return [
    FXHomeBottomNavigationItem("首页","",""),
    FXHomeBottomNavigationItem("影视","",""),
    FXHomeBottomNavigationItem("历史","",""),
    FXHomeBottomNavigationItem("订阅","",""),
    FXHomeBottomNavigationItem("我的","",""),
  ];
}


