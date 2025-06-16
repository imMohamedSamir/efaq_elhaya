import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/cities.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_model/user_profile.dart';
import 'package:hive/hive.dart';

Future<void> callHiveAdapters() async {
  Hive.registerAdapter(CitiesAdapter());
  Hive.registerAdapter(AppMetaDataAdapter());
  Hive.registerAdapter(UserProfileAdapter());
}
