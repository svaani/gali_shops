import 'package:gali_shops/others/firebase_data.dart';

class Product {

    Product(){
          dataRef = FirebaseData("Product");
    }

    FirebaseData dataRef;
    Future<dynamic> getAllByParner(pId) async{
      return await dataRef.getBy("PId",pId);
    }

    Future<bool> createProduct(product) async{
      return await dataRef.add(product);
    }

    Future<dynamic> getProduct(prId) async{
      return await dataRef.getBy("PrId",prId);
    }


    Future<bool> updateProduct(product) async{
      return await dataRef.update("PrId",product);
    }

    

}