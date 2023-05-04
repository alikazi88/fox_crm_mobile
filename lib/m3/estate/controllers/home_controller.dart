import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../models/category.dart';
import '../models/house.dart';
import '../models/chat.dart';

class HomeController extends FxController {
  bool showLoading = true, uiLoading = true;

  List<Chat>? chats;
  List<Category>? categories;

  List<House>? houses;
  List selectedBedRooms = [];
  List selectedBathRooms = [];
  var selectedRange = RangeValues(200, 800);

  @override
  initState() {
    super.save = false;
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    categories = Category.categoryList();
    houses = await House.getDummyList();
    chats = await Chat.getDummyList();
    
    showLoading = false;
    uiLoading = false;
    update();
  }



  @override
  String getTag() {
    return "home_controller";
  }
}
