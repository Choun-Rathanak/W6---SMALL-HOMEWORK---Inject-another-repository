import 'package:provider/provider.dart';
import './data/repositories/songs/song_repository_remote.dart';
import 'data/repositories/songs/song_repository.dart';
import 'main_common.dart';

List<Provider> get providersEnv {
  return [Provider<SongRepository>(create: (context) =>SongRepositoryRemote())];
}

  void main(){
    mainCommon(providersEnv);
  }

