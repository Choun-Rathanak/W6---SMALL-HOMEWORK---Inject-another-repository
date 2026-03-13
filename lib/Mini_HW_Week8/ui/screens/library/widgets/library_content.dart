import 'package:flutter/material.dart';
import 'package:homework/Mini_HW_Week8/utils/AsyncValueState.dart';
import 'package:provider/provider.dart';
import '../../../../model/songs/song.dart';
import '../../../theme/theme.dart';
import '../../../widgets/song/song_tile.dart';
import '../view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});
  
 
  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    LibraryViewModel mv = context.watch<LibraryViewModel>();
    Asyncvalue<List<Song>> asyncvalue = mv.songsValue;
    
    Widget content;
    switch(asyncvalue.state){
      case AsyncValueState.loading:
      content = CircularProgressIndicator();
      break;
      case AsyncValueState.error:
      content = Text('Error');
      break;
      case AsyncValueState.success:
      List<Song> songs = asyncvalue.data!;
      content = ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => SongTile(
                song: asyncvalue.data![index],
                isPlaying: mv.isSongPlaying(asyncvalue.data![index]) ,
                onTap: () {
                  mv.start(asyncvalue.data![index]);
                },
              ),
            );
    }


    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
          SizedBox(height: 50),
      
          Expanded(
            child: content,
          ),
        ],
      ),
    );
  }
}
