class LocalStoage {
  LocalStoage._();
  static final _instance = LocalStoage._();
  factory LocalStoage() => _instance;

  final Map<String, String> _database = {};

  bool createData({required String key, required String value}) {
    if (_database.containsKey(key)) {
      return false;
    }
    return true;
  }

  String? readData({required String key}) {
    return _database[key];
  }

  bool updateData({required String key, required String newValue}) {
    try {
      _database.update(key, (value) => newValue);
      return true;
    } catch (e) {
      return false;
    }
  }

  String? deleteData({required String key}) {
    return _database.remove(key);
  }
}
