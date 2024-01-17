import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:qypt_tech_assign/services/crypto.service.dart';
import 'package:qypt_tech_assign/services/sentiment-analysis.service.dart';
import 'package:qypt_tech_assign/widgets/file.dart';
import 'package:qypt_tech_assign/state/files.state.dart';
import 'package:qypt_tech_assign/widgets/no-files-placeholder.dart';

class FileList extends StatefulWidget {
  const FileList({super.key});

  @override
  State<FileList> createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  final _filesState = FilesState();
  final _cryptoService = CryptoService();
  final _sentimentAnalysisService = SentimentAnalysisService();

  List<PlatformFile> _files = [];
  late StreamSubscription _filesListener;
  RSAPublicKey? publicKey;
  RSAPrivateKey? privateKey;

  @override
  void initState() {
    _subscribeToFiles();
    _genRSAKeys();
    super.initState();
  }

  @override
  void dispose() {
    _filesListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _files != [] ? _filesList() : NoFilesPlaceholder();

  Widget _filesList() => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _files
              .map((file) => _file(
                    file: file,
                  ))
              .toList(),
        ),
      );

  Widget _file({required PlatformFile? file}) => File(
        name: file!.name ?? "No name",
        onButtonPressed: () {
          Uint8List fileMessage = file.bytes ?? Uint8List(8);

          _cryptoService.rsaEncrypt(publicKey!, fileMessage);

          final decodedPublicKey = "${publicKey!.modulus.toString()}${publicKey!.exponent.toString()}";

          _sentimentAnalysisService.analyseMessage(decodedPublicKey, fileMessage);
        },
      );

  void _subscribeToFiles() {
    _filesListener = _filesState.files$.listen((event) {
      setState(() {
        _files = event ?? [];
      });
    });
  }

  void _genRSAKeys() {
    final keyGen = RSAKeyGenerator();

    SecureRandom secureRandom = _cryptoService.getSecureRandom();

    final rsaParams = RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64);
    final paramsWithRnd = ParametersWithRandom(rsaParams, secureRandom);
    keyGen.init(paramsWithRnd);

    final pair = _cryptoService.generateRSAkeyPair(secureRandom);
    publicKey = pair.publicKey as RSAPublicKey;
    privateKey = pair.privateKey as RSAPrivateKey;
  }
}
