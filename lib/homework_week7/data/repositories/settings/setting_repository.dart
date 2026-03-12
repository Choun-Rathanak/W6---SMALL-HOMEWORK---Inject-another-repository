import 'package:homework/homework_week7/model/settings/app_settings.dart';

abstract class SettingRepository {
  
  
  SettingRepository(setting);

  Future<AppSettings> load();
  Future<void> save(AppSettings settings);
  
}
