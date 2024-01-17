import 'package:file_picker/file_picker.dart';

class FileRepository {
  Future<List<PlatformFile>> loadFiles() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'txt'],
      );

      if (result != null) {
        return result.files;
      } else {
        throw Exception('Failed to load files submitted by the user');
      }
  }
}