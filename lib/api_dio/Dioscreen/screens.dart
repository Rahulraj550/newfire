import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../datacontroller/datacontroller.dart';

class Diomain extends StatelessWidget {
  DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.teal,
      floatingActionButton: Obx(() =>
      controller.isNetConnected.value
          ? FloatingActionButton(onPressed:()
    {
    ?controller.scrollToUp()
        :controller.scrollToDown();

      },
      child: FaIcon(controller.isListDown.value
      ?  FontAwesomeIcons().arrowUp
      :FontAwesomeIcons.arrowDown),
      )
          : Container()),
      body: Obx(() =>
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: controller.isNetConnected.value == true
                ? (controller.isLoading.value
                ? Center(
                child: Lottie.asset(height: 100, width:200)) : getData())
                : Center(
              child: Column(),
            ),
          )),
    );
  }
}
RefreshIndicator getData() {
  return RefreshIndicator(child: ScrollablePositionedList.builder(
      itemScrollController: controller.scrollController,
      itemCount: controller.datas.length,
      itemBuilder: (context, index) {
        var data = controller.datas[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white70,
              child: Text(data.id.toString()),
            ),
            title: Text(data.title!),
            subtitle: Text(data.body!),
          ),
        );
      }),
      onRefresh: () {
        return controller.fetchData();
      });
}