import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class FHERepository {
  Future<void> analyseMessage(String evaluationKey, Uint8List encryptedEncoding) async {
    final req = {
      "evaluation_key": evaluationKey,
      "encrypted_encoding": encryptedEncoding,
    };

    final response = await http.post(
      Uri.parse('http://localhost:8000/predict_sentiment'),
      body: json.encode(req),
    );

    if (response.statusCode == 200) {
      final body = response.body;

      return json.decode(body);
    } else {
      throw Exception('Failed to update spaces');
    }
  }
}
