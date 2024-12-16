import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfire/api%20integration/controller/product_controller.dart';

class ProductHome extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("product"),
      ),
      body: sizedBox(
        child:Obx((){
          if (productConroller.isLoding.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else
        })
      )
    );
  }
}
