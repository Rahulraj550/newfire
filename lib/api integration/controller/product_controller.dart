import 'package:get/get.dart';
import 'package:newfire/api%20integration/service/api_service.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList =[].obs;
  @override
  void onInit(){
    getproducts();
    super.onInit();
  }

  void getproducts() async{
    try{
      isLoading(true);
      var products =await HttpService.fetchProductus();
      if(products !=null){
        productList.value=products;
      }
    }
    catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}