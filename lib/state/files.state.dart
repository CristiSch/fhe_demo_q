import 'package:file_picker/file_picker.dart';
import 'package:qypt_tech_assign/repositories/file.repository.dart';
import 'package:rxdart/rxdart.dart';

class FilesState {
  final _fileRepository = FileRepository();

  static final _instance = FilesState._privateConstructor();

  FilesState._privateConstructor();

  factory FilesState() => _instance;

  final _files$ = BehaviorSubject<List<PlatformFile>?>.seeded(null);

  ValueStream<List<PlatformFile>?> get files$ => _files$.stream;

  List<PlatformFile>? get files => _files$.value;

  void loadFileFromLocalStorage() async {
    try {
      final files = await _fileRepository.loadFiles();

      _files$.add(files);
    } on Exception {
      print('Failed to load files from user.');
    }
  }
}