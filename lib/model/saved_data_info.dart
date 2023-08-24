import 'package:hive_flutter/hive_flutter.dart';

part 'saved_data_info.g.dart';

@HiveType(typeId: 0)
class SavedDataInfo {
  @HiveField(11)
  final String name;

  @HiveField(12)
  final List<String> list;

  SavedDataInfo({required this.name, required this.list});
}
