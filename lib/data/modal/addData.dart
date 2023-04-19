import 'package:hive/hive.dart';
part 'addData.g.dart';
@HiveType(typeId: 0)
class AddData extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String iN;
  @HiveField(4)
  DateTime dateTime;

  AddData(this.name, this.explain, this.amount, this.iN, this.dateTime);

}