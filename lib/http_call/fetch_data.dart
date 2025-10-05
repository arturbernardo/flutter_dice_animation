import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  final url = Uri.parse("https://n8n.arturbk.com/webhook/94596dc4-5486-4dc6-8b04-23ed81ec71cd");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Título: ${data['title']}");
    } else {
      print("Erro: ${response.statusCode}");
    }
  } catch (e) {
    print("Exceção: $e");
  }
}
