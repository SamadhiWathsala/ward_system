import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class ImagePickerService {

  // Return file object that contains the image
  Future<File> pickImage({@required ImageSource source}) async {
    return ImagePicker.pickImage(source: source);
  }
}