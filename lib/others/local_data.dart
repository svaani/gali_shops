class LocalData {
  static String _pId;
  static String _pName;

  static String _prId;

  static List _cartList = [];

  static List _trialList = [];

  setPId(pid) {
    _pId = pid;
  }

  getPId() {
    return _pId;
  }

  setPName(name) {
    _pName = name;
  }

  getPName() {
    return _pName;
  }

  setPrId(prId) {
    _prId = prId;
  }

  getPrId() {
    return _prId;
  }

  add2Cart(prId) {
    _cartList.add(prId);
  }

  add2Trial(prId) {
    _trialList.add(prId);
  }
}
