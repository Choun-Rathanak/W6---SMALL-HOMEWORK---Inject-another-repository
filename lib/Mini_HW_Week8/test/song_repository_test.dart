 
import 'package:homework/homework_week7/data/repositories/songs/song_repository_mock.dart';

void main() async {
  //   Instantiate the  song_repository_mock
 final song = SongRepositoryMock();
  // Test both the success and the failure of the post request

  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  // - Using async/await with try/catch.

  testWithFuture(song);
}


Future<void> testWithFuture(SongRepositoryMock song) async{
  try{
    final songTest = await song.fetchSongById("100");
    print("Success : $songTest");
  }catch(e){
    print("Failed: $e");
  }
   try{
    final songTest = await song.fetchSongById("103");
    print("Success : $songTest");
  }catch(e){
    print("Failed: $e");   
  }
}