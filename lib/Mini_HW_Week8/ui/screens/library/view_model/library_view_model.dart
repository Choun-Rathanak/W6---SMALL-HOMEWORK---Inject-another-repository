import 'package:flutter/material.dart';
import 'package:homework/Mini_HW_Week8/ui/states/AsyncValueState.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  List<Song>? _songs;
 Asyncvalue<List<Song>>? songsValue;

  LibraryViewModel({required this.songRepository, required this.playerState, }) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }
  
  List<Song> get songs => _songs == null ? [] : _songs!;

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    // 1 - Fetch songs
    
    // 1- loading state
     songsValue = Asyncvalue(data: null, error: null, state: AsyncValueState.loading);
     notifyListeners();

    try{
      _songs = await songRepository.fetchSongs();
      songsValue = Asyncvalue(data: songs, error: null, state: AsyncValueState.success);
    }catch(e){
      songsValue = Asyncvalue(data: null, error: e, state: AsyncValueState.error);
    }
   

    // 2 - notify listeners
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
