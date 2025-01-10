
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newfire/fake%20store%20with%20category/service.dart';
void main(){
  runApp(GetMaterialApp(initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: ()=> CategoryScreen()),
      GetPage(name: '/categoryDetails', page: ()=>CategoryDetailsScreen())
    ],debugShowCheckedModeBanner: false,));
}
class CategoryScreen extends StatelessWidget {
  final FakestoreService fakestoreService=FakestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: fakestoreService.getMainCategories(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasError){
            return Center(child: Text('error: ${snapshot.error}'));
          }else{
            List<String> mainCategories= snapshot.data!;
            return ListView.builder(
              itemCount: mainCategories.length,
              itemBuilder:(context, index) {
                String category= mainCategories[index];
                return ListTile(
                  title: Text(category),
                  onTap: (){
                    Get.toNamed('/categoryDetails', arguments: category);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CategoryDetailsScreen extends StatelessWidget {
  final FakestoreService fakestoreService = FakestoreService();

  @override
  Widget build(BuildContext context) {
    final String selectedCategory = Get.arguments as String;
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fakestoreService.getProductsByCategories(selectedCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> product = products[index];
                return ListTile(
                  title: Text(product['title']),
                  subtitle: Text(product['description']),
                ); // ListTile
              },
            ); // ListView.builder
          }
        },
      ),
    );
  }
}