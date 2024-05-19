/*abstract class LocalEntity {
  final String key;

  LocalEntity(this.key);
  /*
  factory LocalEntity.fromJson(Type type, Map<String, dynamic> e) {
    switch (type) {
     case Person:
        return Person.fromJson(e);
   case User:
        return User.fromJson(e);
      default:
        throw Exception();
    }
  }*/
}
class LocalEntityRepository {

  Future<void> createOrUpdate(boxName) async {
    await Hive.box<String>(boxName).put(data.key, jsonEncode(data));
  }

  Future<void> deleteData(String id) async {
    Hive.box<String>(boxName).delete(id);
  }

  List<T> getAllEntities<T extends LocalEntity>() {
    final data = Hive.box<String>(boxName).values.map((e) {
      return LocalEntity.fromJson(T, Map<String, dynamic>.from(jsonDecode(e)));
    }).toList();
    return List<T>.from(data);
  }

  T? getEntity<T extends LocalEntity>(String id) {
    final dataLocal = Hive.box<String>(boxName).get(id);
    if (dataLocal == null) return null;
    return LocalEntity.fromJson(
        T, Map<String, dynamic>.from(jsonDecode(dataLocal))) as T;
  }
}
*/