import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ScreenWithFetch extends StatefulWidget {
  const ScreenWithFetch({super.key});

  @override
  State<ScreenWithFetch> createState() => _ScreenWithFetchState();
}

class _ScreenWithFetchState extends State<ScreenWithFetch> {
  Future<Map<String, dynamic>> fetchData() async {
    final url = Uri.parse("https://n8n.arturbk.com/webhook/94596dc4-5486-4dc6-8b04-23ed81ec71cd"); 
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao carregar dados");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chamada HTTP")),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Nenhum dado encontrado"));
          } else {
            final response = snapshot.data!;
            final status = response["status"];
            final message = response["message"];
            final data = response["data"];
            final itemId = data["item_id"];
            final result = data["result"];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Status: $status", style: const TextStyle(fontSize: 18)),
                  Text("Mensagem: $message", style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 16),
                  Text("ID do item: $itemId", style: const TextStyle(fontSize: 16)),
                  Text("Resultado: $result", style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
