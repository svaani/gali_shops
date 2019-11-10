import 'package:gali_shops/others/firebase_data.dart';

class Partner {
  Partner() {
    dataRef = FirebaseData("Partner");
  }

  FirebaseData dataRef;

  Future<bool> doesExist(code) async {
    return await dataRef.doesExist("LoginCode", code);
  }

  Future<String> getPid(code) async {
    var partner = await dataRef.getBy("LoginCode", code);
    return partner[0]["PId"];
  }

  Future<dynamic> getAllByParner(pId) async {
    return await dataRef.getBy("PId", pId);
  }

  Future<List> getAll() async{
    return await dataRef.get();
  }
}
