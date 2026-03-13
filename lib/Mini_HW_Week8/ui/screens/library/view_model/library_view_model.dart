import 'package:flutter/material.dart';
import 'package:homework/Mini_HW_Week8/utils/AsyncValueState.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
 late Asyncvalue<List<Song>> _songsValue;

  LibraryViewModel({required this.songRepository, required this.playerState, }) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  Asyncvalue<List<Song>> get songsValue => _songsValue;

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    // 1 - Fetch songs
    
    // 1- loading state
     _songsValue = Asyncvalue.loading();
     notifyListeners();

    try{
      List<Song> songs = await songRepository.fetchSongs();
      _songsValue = Asyncvalue<List<Song>>.success(songs);
    }catch(e){
      _songsValue = Asyncvalue.error(e);
    }
   

    // 2 - notify listeners
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
