import 'package:gali_shops/models/Category.dart';
import 'package:gali_shops/models/Partner.dart';
import 'package:gali_shops/models/Product.dart';

class API {
  Future<List> getNearByPartners() async {
    return await Partner().getAll();
  }

  Future<List> getFavPartners() async {
    return await Partner().getAll();
  }

  Future<List> getCategoriesByPId(pId) async{
     return await Category().getAllByParner(pId);
  }

  Future<List> getAllProducts(pId) async {
    return await Product().getAllByParner(pId);
  }

  Future<List> getProduct(prId) async {
    return await Product().getProduct(prId);
  }
}
