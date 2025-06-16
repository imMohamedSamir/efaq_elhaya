import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/app_meta_data.dart';
import 'package:efaq_elhaya/Features/Home_View/data/models/app_meta_data/cities.dart';
import 'package:efaq_elhaya/Features/Profile_View/data/models/profile_model/user_profile.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> openHiveBox() async {
  await Hive.openBox<AppMetaData>(kAppMetaData);
  await Hive.openBox<Cities>(kCities);
  await Hive.openBox<UserProfile>(kUserProfile);
}
