import 'package:image_picker/image_picker.dart';

class GalleryImagePickerConstant {
  static Future<XFile?> openCameraGalleryGlobal({
    required bool isCamera,
  }) async {
    final ImagePicker picker = ImagePicker();

    final result = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    return result!;
  }
}
