import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  /// Generic GET request
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(url, headers: headers);
      return _processResponse(response);
    } catch (e) {
      throw Exception('GET request error: $e');
    }
  }

  /// Generic POST request with JSON body
  Future<dynamic> post(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          if (headers != null) ...headers,
        },
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('POST request error: $e');
    }
  }

  /// Process the HTTP response
  dynamic _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      // Parse JSON if body is not empty
      if (body.isNotEmpty) {
        return jsonDecode(body);
      } else {
        return null;
      }
    } else {
      throw Exception('Request failed with status: $statusCode\nBody: $body');
    }
  }
}
