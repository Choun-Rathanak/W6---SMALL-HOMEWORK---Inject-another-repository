import 'package:flutter/widgets.dart';
import 'package:homework/homework_week7/data/repositories/settings/setting_repository.dart';
 
import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
 
  AppSettings? _appSettings;
  SettingRepository setting;
 
  AppSettingsState(this.setting) : _appSettings = AppSettings(themeColor: ThemeColor.blue){  // SET blue default and then it load the new color base on the loadinit from savetheme
    init();
  }

  Future<void> init() async {
    // Might be used to load data from repository
   _appSettings = await setting.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    await setting.save(_appSettings!);
    notifyListeners();
  }
}
