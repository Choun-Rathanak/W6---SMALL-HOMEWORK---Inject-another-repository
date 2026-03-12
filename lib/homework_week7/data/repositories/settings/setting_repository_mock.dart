import 'package:flutter/material.dart';
import 'package:homework/homework_week7/data/repositories/settings/setting_repository.dart';
import 'package:homework/homework_week7/model/settings/app_settings.dart';

class SettingRepositoryMock implements SettingRepository {
  AppSettings curSettings = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    
    await Future.delayed(Duration(milliseconds: 500));
    return curSettings;
  }
  @override
   Future<void> save(AppSettings setting) async{
    await Future.delayed(Duration(milliseconds: 500));
    curSettings = setting;
    
   }

}
