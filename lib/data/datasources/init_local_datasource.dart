import 'package:basic_layout/data/consts.dart';
import 'package:basic_layout/domain/user.dart';
import 'package:hive/hive.dart';

void initLocalDataSource()async{

   Hive.registerAdapter(UserAdapter());
   await Hive.openBox(DataSourceConsts.user_box);


}