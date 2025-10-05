import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  final url = Uri.parse("https://n8n.arturbk.com/webhook/94596dc4-5486-4dc6-8b04-23ed81ec71cd"); 
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Erro ao carregar dados");
  }
}


