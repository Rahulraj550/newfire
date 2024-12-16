import 'dart:ffi';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:newfire/api_dio/service/dioservice.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../modelclass.dart';



class DataController extends GetxController{
  @override
  void onInit() {
    fetchData();
    isInternetConnected();
    super.onInit();
  }
  RxList<Datamodel> datas = RxList();
  RxBool isLoading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;


var scrollController = ItemScrollController() ;
void isInternetConnected() async {
  isNetConnected.value = await InternetConnectionChecker().hasConnection;

}
   fetchData() async {
  isInternetConnected();
  isLoading.value = true;
  var response = await DioService().getData();
  if (response.statuescode == 200){
    response.data.forEach((data){
      datas.add(Datamodel.fromJson(data));
    });
    isLoading.value = false;
  }
}

  scrollToDown() {
    scrollController.scrollTo(
        index: 0,
        duration: const Duration(seconds: 4),
        curve: Curves.bounceInOut);
    isListDown.value = true;
  }

  scrollToUp() {
    scrollController.scrollTo(
        index: 0,
        duration: const Duration(seconds: 4),
        curve: Curves.slowMiddle);
    isListDown.value = false;
  }
}