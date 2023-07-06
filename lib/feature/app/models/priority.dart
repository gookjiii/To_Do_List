import 'package:hive/hive.dart';
part 'priority.g.dart';
@HiveType(typeId: 1,adapterName: 'PriorityAdapter')
enum Priority{
  @HiveField(0)
  basic,
  @HiveField(1)
  low,
  @HiveField(2)
  important
}