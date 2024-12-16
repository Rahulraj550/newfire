import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(
    initialRoute: '/',
    gatPage:[
      GetPage(name: '/', page:
    ]
  ))
}

class Categoriesscreen extends StatelessWidget {
  final FakestoreService fakestoreService= FakestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("main Categories"),
      ),
      body: FutureBuilder<List<String>>(
        future: fakestoreService.getMainCategories(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.error}'));
          } else{
            List<String>mainCategories = snapshot.data!;
          }
        }
      )
    );
  }
}



class CategoryDatailsScreen extends StatelessWidget {
  final FakestoreService FakestoreService = FakestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedCategory Details'),
      ),
      body: future:fakestoreSevice.getProductsByCategory(selectedCategory),
    builder:()
    );
  }
}

