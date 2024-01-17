import 'dart:typed_data';

import 'package:qypt_tech_assign/repositories/fhe.repository.dart';

class SentimentAnalysisService {
  final _fheRepository = FHERepository();

  static final _instance = SentimentAnalysisService._privateConstructor();

  SentimentAnalysisService._privateConstructor();

  factory SentimentAnalysisService() => _instance;

  void analyseMessage(String publicKey, Uint8List message) {
    _fheRepository.analyseMessage(publicKey, message);
  }
}