import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

class ImageAndFileData {
  ImageAndFileData();
  Future getImageData() async {
    final picker = ImagePicker();
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      File image = File(pickedfile.path);
      print(image);
      print(image.path);
      print(image.path.split("/").last);
      return image;
    } else {
      print("no Image");
    }
  }

  Future pickFileData() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      String selectedFilePath = result.files.single.path!;
      return selectedFilePath;
    } else {
      print("no file");
    }
  }



  openSelectedFile(String ?selectedFilePath) async {
    if (selectedFilePath != null) {
      await OpenFile.open(selectedFilePath);
    }
  }

}
