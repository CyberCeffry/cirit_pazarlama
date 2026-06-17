import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

// Yerel veri depolama servisi
class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  late Box<dynamic> _box;

  // Kuruluş
  Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('app_storage');
  }

  // String kaydet
  Future<void> saveString(String key, String value) async {
    await _box.put(key, value);
  }

  // String oku
  String? getString(String key) {
    return _box.get(key) as String?;
  }

  // Int kaydet
  Future<void> saveInt(String key, int value) async {
    await _box.put(key, value);
  }

  // Int oku
  int? getInt(String key) {
    return _box.get(key) as int?;
  }

  // Boolean kaydet
  Future<void> saveBool(String key, bool value) async {
    await _box.put(key, value);
  }

  // Boolean oku
  bool? getBool(String key) {
    return _box.get(key) as bool?;
  }

  // JSON kaydet
  Future<void> saveJson(String key, Map<String, dynamic> value) async {
    final jsonString = jsonEncode(value);
    await _box.put(key, jsonString);
  }

  // JSON oku
  Map<String, dynamic>? getJson(String key) {
    final jsonString = _box.get(key) as String?;
    if (jsonString != null) {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    }
    return null;
  }

  // Liste kaydet
  Future<void> saveList(String key, List<dynamic> value) async {
    final jsonString = jsonEncode(value);
    await _box.put(key, jsonString);
  }

  // Liste oku
  List<dynamic>? getList(String key) {
    final jsonString = _box.get(key) as String?;
    if (jsonString != null) {
      return jsonDecode(jsonString) as List<dynamic>;
    }
    return null;
  }

  // Sil
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  // Tümünü sil
  Future<void> clearAll() async {
    await _box.clear();
  }

  // Var mı kontrol et
  bool containsKey(String key) {
    return _box.containsKey(key);
  }
}
