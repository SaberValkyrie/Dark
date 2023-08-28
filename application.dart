    import 'dart:io';


    class Music {
      late String title;
      late String artist;
      late int duration; // in seconds

      Music(this.title, this.artist, this.duration);
    }

    class MusicController {
      List<Music> musicList = [];

      void addMusic(Music music) {
        musicList.add(music);
      }

      void updateMusic(int index, Music music) {
        if (index >= 0 && index < musicList.length) {
          musicList[index] = music;
        }
      }

      void deleteMusic(int index) {
        if (index >= 0 && index < musicList.length) {
          musicList.removeAt(index);
        }
      }

      Music getMusic(int index) {
        if (index >= 0 && index < musicList.length) {
          return musicList[index];
        }
        return Music("NULL", "NULL", 0); // Return an empty music object if index is invalid
      }

      List<Music> getAllMusic() {
        return musicList;
      }
    }

    void main() {
      var musicController = MusicController();

      while (true) {
        print("1. Thêm Bài Hát");
        print("2. Sửa Bài Hat");
        print("3. Xóa Bài Hát");
        print("4. Danh Sách");
        print("5. Exit");

        var input = stdin.readLineSync();

        try {
          var choice = int.parse(input!);

          switch (choice) {
            case 1:
              print("Nhập Tên Bài Hát:");
              var title = stdin.readLineSync();
              print("Nhập Artist:");
              var artist = stdin.readLineSync();
              print("Thời lượng (seconds):");
              var duration = int.parse(stdin.readLineSync()!);

              var newMusic = Music(title!, artist!, duration);
              musicController.addMusic(newMusic);
              print("Thêm thành công");
              break;

            case 2:
              print("Nhập index của bài hát cần sửa");
              var index = int.parse(stdin.readLineSync()!);
              if (index >= 0 && index < musicController.musicList.length) {
                print("Enter Tên Mới:");
                var newTitle = stdin.readLineSync();
                print("Enter artist mới:");
                var newArtist = stdin.readLineSync();
                print("Enter thời lượng mới (seconds):");
                var newDuration = int.parse(stdin.readLineSync()!);

                var updatedMusic = Music(newTitle!, newArtist!, newDuration);
                musicController.updateMusic(index, updatedMusic);
                print("Update thành công");
              } else {
                print("index không tồn tại");
              }
              break;
            case 3:
              if(musicController.musicList.isEmpty){
                print("Không có bài hát");
                break;
              }
              print("nhập index của bài hát cần xóa");
              var index = int.parse(stdin.readLineSync()!);
              if (index >= 0 && index < musicController.musicList.length) {
                musicController.deleteMusic(index);
                print("đã xóa thành công");
              } else {
                print(" index không tồn tại");
              }
              break;

            case 4:
              if(musicController.musicList.isEmpty){
                print("Không có bài hát");
                break;
              }
              print("List Music:");
              print("==========================================================");
              for (var index = 0; index < musicController.musicList.length; index++) {
                var music = musicController.getMusic(index);
                print("Index $index: Bài Hát : ${music.title} Của: ${music.artist} (Thời lượng ${music.duration} giây)");
              }
              print("==========================================================");
              break;
            case 5:
              print("Exit program");
              return;

            default:
              print("Choose not found");
          }
        } catch (e) {
          print("");
        }
      }
    }
